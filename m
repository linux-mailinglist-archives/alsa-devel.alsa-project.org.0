Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90E6F9AC3
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 19:56:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4007B1FE;
	Sun,  7 May 2023 19:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4007B1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683482192;
	bh=A0cJXkBsb3wg6289DL+K+OBfPVWW2fCNA5UoZ957Edg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HseYw67R18JmMrYwJPW/uvm43ZHhhpMML111r+KhVoHNHXJViy+mae1awLm4VupyD
	 X6cnF7fX9bfVHOhMt3/aBTlRR6qMSkqQK7dGsjCIQ1hSI77JZ2BaseRexlyP4KCAlH
	 /bQkJslkIe4J1EuKJXY8JVkzdDhORN8Z2sKViAd4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88A28F80310;
	Sun,  7 May 2023 19:55:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB961F8032D; Sun,  7 May 2023 19:55:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F953F80217
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 19:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F953F80217
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1683482131199226856-webhooks-bot@alsa-project.org>
References: <1683482131199226856-webhooks-bot@alsa-project.org>
Subject: Bug: premature stringification in SND_DLSYM_BUILD_VERSION produces
 wrong results for alsa-plugins.
Message-Id: <20230507175538.AB961F8032D@alsa1.perex.cz>
Date: Sun,  7 May 2023 19:55:38 +0200 (CEST)
Message-ID-Hash: L5JGFNDIKTMECDLP4DCWKPDHIGTX7IC6
X-Message-ID-Hash: L5JGFNDIKTMECDLP4DCWKPDHIGTX7IC6
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L5JGFNDIKTMECDLP4DCWKPDHIGTX7IC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #316 was opened from MIvanchev:

The macro:

```
#define SND_DLSYM_BUILD_VERSION(name, version) \
  static struct snd_dlsym_link __SND_DLSYM_VERSION(snd_dlsym_, name, version); \
  void __SND_DLSYM_VERSION(snd_dlsym_constructor_, name, version) (void) __attribute__ ((constructor)); \
  void __SND_DLSYM_VERSION(snd_dlsym_constructor_, name, version) (void) { \
    __SND_DLSYM_VERSION(snd_dlsym_, name, version).next = snd_dlsym_start; \
    __SND_DLSYM_VERSION(snd_dlsym_, name, version).dlsym_name = # name; \
    __SND_DLSYM_VERSION(snd_dlsym_, name, version).dlsym_ptr = (void *)&name; \
    snd_dlsym_start = &__SND_DLSYM_VERSION(snd_dlsym_, name, version); \
  }
```
should actually be
```
#define SND_DLSYM_NAME(name) #name

#define SND_DLSYM_BUILD_VERSION(name, version) \
  static struct snd_dlsym_link __SND_DLSYM_VERSION(snd_dlsym_, name, version); \
  void __SND_DLSYM_VERSION(snd_dlsym_constructor_, name, version) (void) __attribute__ ((constructor)); \
  void __SND_DLSYM_VERSION(snd_dlsym_constructor_, name, version) (void) { \
    __SND_DLSYM_VERSION(snd_dlsym_, name, version).next = snd_dlsym_start; \
    __SND_DLSYM_VERSION(snd_dlsym_, name, version).dlsym_name = SND_DLSYM_NAME(name) \
    __SND_DLSYM_VERSION(snd_dlsym_, name, version).dlsym_ptr = (void *)&name; \
    snd_dlsym_start = &__SND_DLSYM_VERSION(snd_dlsym_, name, version); \
  }
```
This is because for instance [this code](https://github.com/alsa-project/alsa-plugins/blob/master/pulse/ctl_pulse.c#LL823C1-L823C30) `SND_CTL_PLUGIN_SYMBOL(pulse);` expands to

```
SND_DLSYM_BUILD_VERSION(SND_CTL_PLUGIN_ENTRY(pulse), SND_CONTROL_DLSYM_VERSION);
```
and this expands to
```
...
__SND_DLSYM_VERSION(snd_dlsym_, name, version).dlsym_name = # SND_CTL_PLUGIN_ENTRY(pulse)
...
```
but the C preprocessor doesn't expand stringified tokens so the value of `dlsym_name` is actually `"SND_CTL_PLUGIN_ENTRY(pulse)"`.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/316
Repository URL: https://github.com/alsa-project/alsa-lib
