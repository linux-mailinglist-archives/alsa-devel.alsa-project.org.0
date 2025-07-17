Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 656AFB08326
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jul 2025 04:56:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6130601CE;
	Thu, 17 Jul 2025 04:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6130601CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752720948;
	bh=jFcsl5filmQ3Vox0fgCL2gTPKHlqrWDg+y70ay3/r5w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=efpHG7Y5P2NZ0RY95E8HmYw0rsmldAKMBW4fj8hi2q0FFPAKa2vpkvBHi7+xOY5ek
	 Bz9BOmyo/zym0pbEneUpRt2ye3wDYyq+KwwYpFFCRV8MiSy/7o7MdrITnzXvaonuOQ
	 HuIuMIiP8aVIJAVG6eJ1rSo7GI2BW/t2rtuzW/PE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94609F805C4; Thu, 17 Jul 2025 04:55:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8598BF805C4;
	Thu, 17 Jul 2025 04:55:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E1F1F80217; Thu, 17 Jul 2025 04:54:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 467E2F800F3
	for <alsa-devel@alsa-project.org>; Thu, 17 Jul 2025 04:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 467E2F800F3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1852ea5b3e986500-webhooks-bot@alsa-project.org>
In-Reply-To: <1852ea5b3e41fa00-webhooks-bot@alsa-project.org>
References: <1852ea5b3e41fa00-webhooks-bot@alsa-project.org>
Subject: qcom-lpass: RX HPH Mode is set to a ULP mode which causes distortion
Date: Thu, 17 Jul 2025 04:54:47 +0200 (CEST)
Message-ID-Hash: IYO4BMBS3GHBS4LLKC5TLPFQDXEWKTSG
X-Message-ID-Hash: IYO4BMBS3GHBS4LLKC5TLPFQDXEWKTSG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IYO4BMBS3GHBS4LLKC5TLPFQDXEWKTSG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #595 was opened from valpackett:

The headphone enable sequence for all Qualcomm devices sets `CLS_H_ULP` mode:

https://github.com/alsa-project/alsa-ucm-conf/blob/1b69ade9b6d7ee37a87c08b12d7955d0b68fa69d/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneEnableSeq.conf#L1-L3

I was trying to figure out why I was getting horrendous distortion on the headphone jack of my Dell Latitude 7455 laptop above a certain relatively-quiet volume level. After lots of fiddling and searching (thanks, [XDA forum audio modders](https://xdaforums.com/t/mod-audio-biquads-utilizing-qualcomms-audio-codec-for-headphone-compensation.3093000/post-72175274) from several years ago!) I figured it out. Changing that to `CLS_AB_HIFI` has completely fixed the distortion!

Should the default be changed to a HIFI mode for everyone, i.e. right in that file?

ping: @Srinivas-Kandagatla

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/595
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
