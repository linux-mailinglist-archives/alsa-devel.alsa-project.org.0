Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 738577BEAB5
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 21:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B100CED8;
	Mon,  9 Oct 2023 21:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B100CED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696880211;
	bh=ztzO0FP2n7mxeegciH74/PuIP43zv0rB6yVMvGm6tOc=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GLWOw1Xc2tL/0wWsONJ+sa88O3I0ipXCgn/JqSXDV4Jbr8sPUK3kGa5gsESEa1YwP
	 vTeLcJqRIeTJi3JmlJwWKl4fhKGeDjxY+wHfMBT5RDchQMiCXEf7/XFsvPtBHDlDO3
	 yvGT3w5dHNifX/Kf+XnW1cYuSP02KFXoApCcuZ/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DAA3F80553; Mon,  9 Oct 2023 21:36:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0605AF8027B;
	Mon,  9 Oct 2023 21:36:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 078D6F802BE; Mon,  9 Oct 2023 21:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6485EF80130
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 21:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6485EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256
 header.s=2017 header.b=GS6JVBBp
Received: from submission (posteo.de [185.67.36.169])
	by mout02.posteo.de (Postfix) with ESMTPS id B3EA7240101
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 21:35:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1696880153; bh=ztzO0FP2n7mxeegciH74/PuIP43zv0rB6yVMvGm6tOc=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Transfer-Encoding:From;
	b=GS6JVBBpd6g5Kczxm3mgIP8G/7PI2td4YkgOw4rH4PnHEOb/o/1OumR3BBXECKHpI
	 VSh4gR1bWHHjNDoIdZ/wa6/J8EFlSq9lyHCfZ0mBRAnkSeGISgxqOAlbbt0ZIhMW2D
	 UchJ2WEUFqz+q/6KnQ6H7OhocHg5odnIEfvIMGHvsMA4BXhAB092Ww1wuinC+tH5i5
	 PfClRlPFndXDv9irfnk9OmlUonahp9uSdCpbt/S9wipzErRIa5Xlay9Rv65udgVSNy
	 CWZD75C6xNeVWLTQ0yZ5Tx2eke1r+QSs9B5M/WxufXrAv+hRcIBMLvsZVb6sd9UGF1
	 iFAXJNgZi6xuQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4S48Qd29Rkz9rxW
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 21:35:53 +0200 (CEST)
Message-ID: <a2be3443-392c-46aa-8879-8ac0cfa97f28@posteo.net>
Date: Mon,  9 Oct 2023 19:35:53 +0000
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
Content-Language: fr
From: prts <prts@posteo.net>
Subject: Alsa change value to limit maximum volu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IWEM5X4SZRH53MAVBJTRQGVVCYM6YVTW
X-Message-ID-Hash: IWEM5X4SZRH53MAVBJTRQGVVCYM6YVTW
X-MailFrom: prts@posteo.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWEM5X4SZRH53MAVBJTRQGVVCYM6YVTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi!

I am trying to limit the maximum allowed volume without using any 
softvol (I want to control direct hardware mixer, no dmix). My card is 
an external usb DAC, stating:

`amixer -c Balanced`
Simple mixer control 'D10 Balanced',0
   Capabilities: pvolume pvolume-joined pswitch pswitch-joined
   Playback channels: Mono
   Limits: Playback 0 - 127
   Mono: Playback 34 [27%] [-93.00dB] [on]

Limits are from 0 to 127. I would like to tune this manually so that 
anything using the card in the system will (for example) never go beyond 
98 (and not 127).

I noticed that this value is in /var/lib/alsa/asound.state.
Any possibility to change this value?

Thanks and have a nice day.

Sylvain
