Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D744745B00
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 13:26:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F395483B;
	Mon,  3 Jul 2023 13:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F395483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688383585;
	bh=ZR1jgdwkqyoHZ5Q2CN6DRRaDj/yQFagQ2sKLVSJhIUM=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ETapoAjO1EDhcSxxUI48Mc9hmdXDvmvLMAAv28qJ8vJlobuWNUC7GQYt5QCIs9mVX
	 0CC/Uc/DBA+mmXRyK2tIq8seVTLFC6MuMa2ppFjvBWtyil96bz2N+2t1pkG6xKht5k
	 7RWp57T+8ky4yn66wriGzXV7m3jM6LkKv+DSvtDA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80AEAF80558; Mon,  3 Jul 2023 13:25:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 430FDF80544;
	Mon,  3 Jul 2023 13:25:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38287F80548; Mon,  3 Jul 2023 13:25:14 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D8CAF80125
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 13:25:14 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Symbolic Debugger" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Mon, 03 Jul 2023 11:25:14 -0000
Message-ID: 
 <168838351418.22.11061517331604041582@mailman-web.alsa-project.org>
In-Reply-To: <87ttul5mbh.wl-tiwai@suse.de>
References: <87ttul5mbh.wl-tiwai@suse.de>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: 2SO4WH6MS4WMJEIJN4MCHICZWV2GYP47
X-Message-ID-Hash: 2SO4WH6MS4WMJEIJN4MCHICZWV2GYP47
X-MailFrom: happy.debugging@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JB6MDRM2T7U2RALBYNEGBYMKHISZ6FNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

That's what I thought and checked, but did not see newfile, but now I do, Perhaps I checked a wrong repo. I pulled the latest repo, compiled (gitcompile) but it did not generate .so but it reports lot of .lo files. I wish not to overwrite the current libasound.so., so should it be :  make install with  --libdir=<my directory> to generate the .so files ?
