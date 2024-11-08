Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AB29C24EE
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2024 19:34:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AD01F53;
	Fri,  8 Nov 2024 19:33:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AD01F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731090848;
	bh=G7QzV8ec7P/rqlT+0x2vpcQHnG6n/eY3/drF1iFbNAI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=G6ruizHQAcKORJnrAuj4QCJdz9vDuRgFs4F0I766gI1YohSE3p2LtAiWMnQ8Y/Zd9
	 7AqqEWlkllB6M1vmCBihe5jZsfdXJvXLsQtl8BaYc2AwzBW3358U1sMCOMSs8h6fm3
	 er45R3jlxexw9yeGoIPorGAgRpPjFAoQbQ/H2pSk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28289F805B0; Fri,  8 Nov 2024 19:33:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F13EF805B1;
	Fri,  8 Nov 2024 19:33:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 949CFF8013D; Fri,  8 Nov 2024 19:33:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id D4594F800BD
	for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2024 19:33:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4594F800BD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1731090805288288116-webhooks-bot@alsa-project.org>
References: <1731090805288288116-webhooks-bot@alsa-project.org>
Subject: [Question] About Roland Rubix series, alsa-ucm-conf and snd_usb_audio
Message-Id: <20241108183327.949CFF8013D@alsa1.perex.cz>
Date: Fri,  8 Nov 2024 19:33:27 +0100 (CET)
Message-ID-Hash: PXORVLU4TAWEOAQ3SGN4ONC4GXWNLRM2
X-Message-ID-Hash: PXORVLU4TAWEOAQ3SGN4ONC4GXWNLRM2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXORVLU4TAWEOAQ3SGN4ONC4GXWNLRM2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #459 was opened from sim590:

I want to understand what `alsa_ucm-conf` is about exactly regarding the support for specific devices. I'm thinking to buy a Roland Rubix series audio interface (either 22 or 24) and I'm wondering if both my XLR inputs are gonna appear in alsa/pulseaudio/pipewire as separate input lines. Does that require a potential change in `snd_usb_audio` kernel module or only a configuration file on this repository? I've looked at the configuration files on this repository and I have found a Roland directory, but nothing about the Rubix series explicitly.

Presently, I have a Focusrite Scarlett 2i2 *fake clone* (unfortunately) which I'm gonna return shortly because it's counterfeit. As of right now, I don't see the two separate outputs, but only the following input:

![image](https://github.com/user-attachments/assets/7bf58e54-67d1-4e20-989c-5e1ec0828850)

which takes audio from my first XLR input port. I guess that's the class compliant interface behaviour. Correct me if I'm wrong, I'm trying to learn about all of this.

So, I just wanna be sure that if I go and buy my Roland Rubix, that the device is actually gonna show up the two input lines, and if not that I will know what I will have to do to make it so. Is there gonna be a configuration file required in `alsa-ucm-conf`? Any potentiel change in `snd_usb_audio` kernel module? I'm a bit confused about the details regarding the support of the audio interface devices.

Thanks.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/459
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
