Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ACAAC49BE
	for <lists+alsa-devel@lfdr.de>; Tue, 27 May 2025 09:58:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE67A60196;
	Tue, 27 May 2025 09:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE67A60196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748332723;
	bh=Bw885He0WZWHVlX8cBwM3ERyZ6ZyASW2E2EfeBFVTNo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QpSKM8bPNYVoG8ncUqPo9pzHcfTg/Kp3IVYKdDw5lDGm2dQ1UN+/o4mXryaKjlv+k
	 AW2jDHFIAVIKTXhBAGnzRZ65MrlxT7KyU/O+jgbOJ8EjncSr6cZb2PGraA2IREzN2C
	 5im6Uvk86FscgItNdglIdukrBBf4OMFnKOkKerE4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DCC0F800F0; Tue, 27 May 2025 09:58:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 254F3F805BB;
	Tue, 27 May 2025 09:58:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE4E9F800F0; Tue, 27 May 2025 09:58:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 27DA8F800D2
	for <alsa-devel@alsa-project.org>; Tue, 27 May 2025 09:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27DA8F800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1843535080e42c00-webhooks-bot@alsa-project.org>
In-Reply-To: <1843535080d02c00-webhooks-bot@alsa-project.org>
References: <1843535080d02c00-webhooks-bot@alsa-project.org>
Subject: Regex question
Date: Tue, 27 May 2025 09:58:07 +0200 (CEST)
Message-ID-Hash: VE6ZDWAHF4L3Z5B2QRSS7Y7Z2PDHCEJJ
X-Message-ID-Hash: VE6ZDWAHF4L3Z5B2QRSS7Y7Z2PDHCEJJ
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VE6ZDWAHF4L3Z5B2QRSS7Y7Z2PDHCEJJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #567 was opened from shumingfan:

We have an Intel platform machine that equips the rt722 multi-codecs and rt1320 amplifier.
This machine driver will use the amp of rt722 and rt1320 both.
Therefore, the component string is shown below.

`Components    : 'HDA:8086281d,80860101,00100000  cfg-amp:2 hs:rt722 spk:rt722 spk:rt1320'`

I tried to modify the regular expression to capture substrings to SpeakerCodec1 and SpeakerCodec2 variables.
However, I can't get SpeakerCodec2="rt1320", even though I changed the regular expression to 
```
SpeakerCodec {
	Regex " spk:(rt722)| spk:(rt1320)"
	String "${CardComponents}"
}
```
The variable SpeakerCodec2 is still an empty string.
What do I miss?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/567
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
