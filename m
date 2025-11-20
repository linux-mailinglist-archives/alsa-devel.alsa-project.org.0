Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6493C73016
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 10:03:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4050C601B2;
	Thu, 20 Nov 2025 10:03:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4050C601B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763629418;
	bh=FvsqzrFLDZGiZGqyhTXpJPn4/vLD/xOXQippaexB3pc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gUmXg7XGPMbbu5CACxFLT+TQoKGkHkLzIYQIfvV9kUq+AEe2zLOdstGtZubLGHYC6
	 BKBgiMVV3KY9uUBwrKlUznnZwsd/vwuhDmDHacRI9ds9XWe8yVHalnXfUh+Qfs25ci
	 a5hsR9CjAm2kDn95Ayj50hoL5HyqGFHy+yia5AGM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17C35F805C7; Thu, 20 Nov 2025 10:03:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D7FF805C6;
	Thu, 20 Nov 2025 10:03:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BC70F8021D; Thu, 20 Nov 2025 10:02:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86702F80072
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 10:01:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86702F80072
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=Xd1XGU3U
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AK91sxoE1198788,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763629314; bh=FvsqzrFLDZGiZGqyhTXpJPn4/vLD/xOXQippaexB3pc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Xd1XGU3U3J+fW+ZhyiHtKgTN6/PLbbycN1BSew0WRsJpyiTW4DACauV2V2VIDrbT6
	 weV2GOi1bzaYRJPGPSe+nnH7qOlpXPLj2hwK4IpQ8JxZjwjpJNYWHhp18Mn1Dbhlxy
	 JSAp2O2Hfd0N9tQWXDJBGuhC74mXh4kE2I074igIKFLHkUOHEvgOFdSBdJNAuUM3k2
	 kwgupB3FRhext1bMyVpsrtj6awD/toDD+MBymNZmRUND0pSI+2ltAeUwhgdnRFReBE
	 YFse8Cw6LEOng1Pjt+pchCL0ayUI4PjV5LcnaDrzz4O/RCn4/0E4V2zA7CThyFcIjG
	 zQVXtrFjUzbhg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AK91sxoE1198788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Nov 2025 17:01:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Thu, 20 Nov 2025 17:01:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::744:4bc9:832c:9b7e%10]) with mapi id
 15.02.1544.027; Thu, 20 Nov 2025 17:01:55 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: Support Tas2781 and mute led for HP platform
Thread-Topic: Support Tas2781 and mute led for HP platform
Thread-Index: AdxZ9TkHdwxlpI8gQJCC76hamazeYP//hcOA//93wYA=
Date: Thu, 20 Nov 2025 09:01:55 +0000
Message-ID: <f2462c6e04a04360a0f9f4cdd5f87af1@realtek.com>
References: <c9c11acbefa24f7e8d0c62daecc00ac8@realtek.com>
 <87see9axv2.wl-tiwai@suse.de>
In-Reply-To: <87see9axv2.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: 6PDBDYWFOY4IJ7T2WP3RITAYD52LAJQI
X-Message-ID-Hash: 6PDBDYWFOY4IJ7T2WP3RITAYD52LAJQI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6PDBDYWFOY4IJ7T2WP3RITAYD52LAJQI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Thursday, November 20, 2025 4:54 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> linux-sound@vger.kernel.org
> Subject: Re: Support Tas2781 and mute led for HP platform
>=20
>=20
> External mail : This email originated from outside the organization. Do n=
ot
> reply, click links, or open attachments unless you recognize the sender a=
nd
> know the content is safe.
>=20
>=20
>=20
> On Thu, 20 Nov 2025 09:12:38 +0100,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > Attach patch was supported Tas2781 and mute led for HP platform.
>=20
> Applied to for-next branch now.
> A comma was missing in the table entry, so I corrected it locally.
Thanks.
>=20
>=20
> thanks,
>=20
> Takashi
