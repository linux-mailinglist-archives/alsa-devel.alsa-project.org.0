Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4473F54EEB0
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 03:16:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C50781B2B;
	Fri, 17 Jun 2022 03:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C50781B2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655428578;
	bh=xpJCQZ6cXuZF1RcLg6Gxx6C09mxc99Dd+yew3LelQzo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D2spBcjbnABpT6SAB8VIEulUZr1dWyAtjAH5mzTFJsMqQ33vyWeUZMH9N19v91xRS
	 WLhqUUbrvFYy/Lgh5z7sgJMfd8Zv6FoUqgNtJ/4U+QoEXsuJCLzwJy+JwNwyGupwl7
	 qc25ZMYgBcBlEWURqPUxxYYx0AvfSVPRCau1yqnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33F47F800D3;
	Fri, 17 Jun 2022 03:15:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7F79F801D8; Fri, 17 Jun 2022 03:15:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4C02BF800F0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 03:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C02BF800F0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1655428510779361963-webhooks-bot@alsa-project.org>
References: <1655428510779361963-webhooks-bot@alsa-project.org>
Subject: Regression: Upgrade to 1.2.7 Causes No HDMI Audio Device on AMD
 Trinity APU
Message-Id: <20220617011517.C7F79F801D8@alsa1.perex.cz>
Date: Fri, 17 Jun 2022 03:15:17 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #239 was opened from lovenemesis:

After upgrading to alsa-lib 1.2.7, HDMI Audio from AMD A10-5800K "Trinity" series APU stopped working. HDMI Audio is no longer presented as a Output Device in GNOME Setting - Audio. aplay -l shows error for HDMI device: 

`aplay: device_list:304: control digital audio info (0): Input/output error`

**Downgrading to alsa-lib to 1.2.6** restore the HDMI audio device on A10-5800K system. 

Below are some system info I collected when running alsa-lib-1.2.6 and alsa-lib-1.2.7

[alsa-lib-1.2.6.txt](https://github.com/alsa-project/alsa-lib/files/8923675/alsa-lib-1.2.6.txt)

[alsa-lib-1.2.7.txt](https://github.com/alsa-project/alsa-lib/files/8923676/alsa-lib-1.2.7.txt)

It appears to me that kernel, pipewire, wireplumber versions have no impact on the occurrence of the issue.

It is also reported in [RedHat Bugzilla](https://bugzilla.redhat.com/show_bug.cgi?id=2097574)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/239
Repository URL: https://github.com/alsa-project/alsa-lib
