Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D59182A5E17
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 07:21:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AD9B169E;
	Wed,  4 Nov 2020 07:20:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AD9B169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604470887;
	bh=+X3+ccK6Gu8PpGKCJCygG86P7bl+Fk54k8ab9w4p6p0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7QHGAD1e1lMKBk2dAPtHVZxMCF5IPKEWLigNZc9/peZT2vbfPQjOTjX2PbqxuMCK
	 wS+L8FYwgW2rPQYPHPBqxDzXI7I57GDipxmCdagKdnb1qmWpEbIygB2nyGsUfhIJ9Y
	 fGqcezoZE2/F+XLKEh+GyBNWavAOZgAIpLgTfNe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E7FBF8023E;
	Wed,  4 Nov 2020 07:19:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F155F80234; Wed,  4 Nov 2020 07:19:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FD53F800EC
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 07:19:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FD53F800EC
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0A46Ja5zA027656,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0A46Ja5zA027656
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 4 Nov 2020 14:19:37 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Wed, 4 Nov 2020 14:19:36 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Wed, 4 Nov 2020 14:19:36 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2]) by
 RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2%8]) with mapi id
 15.01.2106.003; Wed, 4 Nov 2020 14:19:36 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: ASUS TM420 headphone enable
Thread-Topic: ASUS TM420 headphone enable
Thread-Index: AdaxtaxRO3Y6pYlvT6+6jYCrnkWx/AADp1AAACuH/EA=
Date: Wed, 4 Nov 2020 06:19:36 +0000
Message-ID: <3d215da3458e4bc3b0a2586abdd81b34@realtek.com>
References: <3d6177d7023b4783bf2793861c577ada@realtek.com>
 <s5hy2jil51d.wl-tiwai@suse.de>
In-Reply-To: <s5hy2jil51d.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
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


Many Thinks.

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, November 4, 2020 1:33 AM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: ASUS TM420 headphone enable
>=20
> On Tue, 03 Nov 2020 08:49:38 +0100,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > ASUS TM420 need to use COEF bit to turn on HP.
> > Attach was enable patch.
>=20
> The patch seems missing the enum definition, so I corrected locally, and
> applied it to for-linus branch now.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> >
> > BR,
> > Kailang
> > [2 0001-asus-enable-hp.patch <application/octet-stream (base64)>]
> >
>=20
> ------Please consider the environment before printing this e-mail.
