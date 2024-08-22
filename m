Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9591A95AF6C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 09:39:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 145BE7F8;
	Thu, 22 Aug 2024 09:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 145BE7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724312365;
	bh=Tma2WLAgAbq9Vk4gonyHtLmOVPCqKQNos60qgKq6XJg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IP8Tcv+hBR8RyXB/RlOZT4TvKnyVnX4nLTihaeA0bWhgTsw9ysZ33iKhzlMVkLDxb
	 eVv2SHC+xvSMj+FWr6Oha5jzXm0DFodAN5nUpyq/HUfjzQmbLGtuE0bpfzQfS3OSzy
	 kR+aiNkFIq+TOQDlRdeoVSWO4DfmOo0vfH6tVOEw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77AA5F805BB; Thu, 22 Aug 2024 09:38:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B37A6F8058C;
	Thu, 22 Aug 2024 09:38:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40B4AF80496; Thu, 22 Aug 2024 09:38:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AC16F80107
	for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2024 09:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC16F80107
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=fsaxGW3h
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 47M7cbgO73715870,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1724312317; bh=Tma2WLAgAbq9Vk4gonyHtLmOVPCqKQNos60qgKq6XJg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fsaxGW3hAWgTmO6//P8tdqru9yMhUU52RWfFgHCMbDnojt3cM8YQ0Q7LF9L8STBpt
	 2Chby4DihX+EQ4BMX0uchks+JwVNJWHRdaMRIvfkWrLrTXG39GvV02HSUAhVwtYdZ7
	 F/vEZGFbI/tZ6xScAIWqNc5n5z6Ez+T37aHH3/w3VSW0yqAN03yQejq7xrF0dMtgx5
	 SYFregHD+iyJm3KscPU0bDIt/bDfeMSNwwYvoh8Ax4AaM2XF2wNKMKzEjEm984zP81
	 UoYYBGR6tgQTx2D75OPc16YBPxVXRBtXLbLNDY5+69UFE45tjHsxDIZi7WcmeG+4+k
	 BQMk2gAepZOlQ==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.02/5.92) with ESMTPS id 47M7cbgO73715870
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 15:38:37 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 15:38:37 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Aug 2024 15:38:36 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Thu, 22 Aug 2024 15:38:36 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: RE: ALC256 headphone no sound
Thread-Topic: ALC256 headphone no sound
Thread-Index: Adr0QRE/+pXiSackS2mnnWuPh86In///w0cA//95DqA=
Date: Thu, 22 Aug 2024 07:38:36 +0000
Message-ID: <16c7492e82d24049aa01435968865a75@realtek.com>
References: <bb8e2de30d294dc287944efa0667685a@realtek.com>
 <87frqxnh7t.wl-tiwai@suse.de>
In-Reply-To: <87frqxnh7t.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: CSKBM4PVP5PXNMIYXT7C2YLXPMT2BVIA
X-Message-ID-Hash: CSKBM4PVP5PXNMIYXT7C2YLXPMT2BVIA
X-MailFrom: kailang@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CSKBM4PVP5PXNMIYXT7C2YLXPMT2BVIA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Thursday, August 22, 2024 3:35 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: ALC256 headphone no sound
>=20
>=20
> External mail.
>=20
>=20
>=20
> On Thu, 22 Aug 2024 05:14:06 +0200,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > Attach patch will solve headphone issue for alc256.
> > Many Thanks.
>=20
> There was a minor coding-style issue, and I corrected locally and applied=
.

Thank you.

>=20
>=20
> thanks,
>=20
> Takashi
