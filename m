Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B6B2F539
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Aug 2025 12:25:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55EEB60239;
	Thu, 21 Aug 2025 12:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55EEB60239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755771896;
	bh=G29aGQpaCGqPl+YUre52/fMTAERRqlzegT2X6kFxlT8=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=anrGUp3QeCMIhAPZtnKvJ4TwoCbGniZM4czG1+duk4H+1odNm+TMvaMWLUgnr758W
	 jN7C2GlY+1BLS9fkWt+Kq7a+WKputB0pQuOSyUwFSiJnzQAtB0FhzoGuuiAXCsK5nI
	 qb0VP8FlZIHQz8LvS2zsLTdLqMF/UamjvX9j8q9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BF2BF805C4; Thu, 21 Aug 2025 12:24:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9168F805C3;
	Thu, 21 Aug 2025 12:24:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDC2FF80518; Thu, 21 Aug 2025 12:24:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C397DF80254
	for <alsa-devel@alsa-project.org>; Thu, 21 Aug 2025 12:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C397DF80254
Received: from [192.168.2.202] (p57bd9257.dip0.t-ipconnect.de [87.189.146.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 87DDA6028827A
	for <alsa-devel@alsa-project.org>; Thu, 21 Aug 2025 12:24:08 +0200 (CEST)
Message-ID: <3d484a99-09fd-4086-812c-70c45c0ba6c0@molgen.mpg.de>
Date: Thu, 21 Aug 2025 12:24:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Low maximum volume with Plantronics Blackwire 315.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: P52D5SMEE2KOYVMAUT2YJRDAXPGRDUPT
X-Message-ID-Hash: P52D5SMEE2KOYVMAUT2YJRDAXPGRDUPT
X-MailFrom: pmenzel@molgen.mpg.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P52D5SMEE2KOYVMAUT2YJRDAXPGRDUPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dear Linux folks,


On the Intel Kaby Lake laptop Dell XPS 13 9360, using Debian 
sid/unstable with Debian sid/unstable and Linux 
6.17.0-rc2-00053-gb19a97d57c15, connecting the USB headset Plantronics 
Blackwire 315.1, even turning the volume on the headset control (or 
GNOME, both are linked) to maximum, the volume is still very low. 
`pavucontrol` shows everything on 100 %.

Is that a driver problem, or somehow a hardware property?

I uploaded the files done by `/sbin/alsa-info` [1].


Kind regards,

Paul


[1]: https://alsa-project.org/db/?f=ccc9945a112e88c7b6bf29ecc072f05e0cb72f3f
