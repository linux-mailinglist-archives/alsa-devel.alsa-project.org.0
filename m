Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED1BABFE7A
	for <lists+alsa-devel@lfdr.de>; Wed, 21 May 2025 22:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C16D8601E8;
	Wed, 21 May 2025 22:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C16D8601E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747860762;
	bh=9iR8IRTU+6tBVXCfEjrdYiIimKV+d4fsyZWvwGgz+DY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KViSUxfz968+qwLTng23c1o4eDDUJoE3DB6fWQuBl5ZZn1Q6bcv9/DUlQFHeogG7F
	 AlA8jbYW6eWZQlpI8WrdymkRa5Pl+sr0GVo0JxAV4bT5D9mvStL6TBrw7y2cAnimUs
	 quiIlDC+8FQ9uiKxdmNafxEsXfper7lAsRaLtl+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58160F805A9; Wed, 21 May 2025 22:52:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45C51F80580;
	Wed, 21 May 2025 22:52:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DBA1F80537; Tue, 20 May 2025 19:12:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sonic316-54.consmr.mail.gq1.yahoo.com
 (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8325AF80269
	for <alsa-devel@alsa-project.org>; Tue, 20 May 2025 19:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8325AF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=DRIHhyS1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1747761170; bh=9iR8IRTU+6tBVXCfEjrdYiIimKV+d4fsyZWvwGgz+DY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=DRIHhyS1OR8xnx/V6hbfJhouMPh8IXYDhvHNrQiq3KZ3ESN5Fy3IlFlUbC0Iy0pd+pAzGvCDRs0CU+xPtnk6tv90EZMpInO0ptnJLgPqojp16EeUrvo3lYZ9ugd7+s88HIlgziX+hpIaHRHtbFH0Hx1JGm8KOHCfr/5+78qGyw4qD4Rk8XIWguzRjghnVoAbdkZva10EoEBUnSGZYErzj3teRwlMTJisrCcB36XUjDNjcQs/uTF3qfshBkTNEsFYtad2jOo5+ojbAsuxF2+yA3YkpZ+SOl+2HlypjBbu6Ji2WDmlEHIX+H/k4U1kJSC9Jz8XMeQ+C/IG6MWEAUh+jw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1747761170; bh=1kRFyAYEnBf4mOSgf4NKq2BzEJGE3kFfKKhoCHGhoJs=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=GMXt/gjoaGRbCn/hPc2PIDGlGpsdz1k0YNNE9XfDFjc0ycjOTA/4KRi4HiJBEqW5/vMa1vv81GCVcmm2bhMH29igKTuoa5V+hWSks1dg61MB0QATPUJdiWLCUj/8uxCMetJuPosdEH+2Y8t14cJeYKwRzJIlb4b5nX4NQV+xlhyQ2KOWdJ+FfVqH6upSW1u4W62UyswVwOZ5WQiifL00jfK927njCP71JMp82+Serj/APGv6wWqkF8uWJVe6lYc7kNjoLcFdsEdbzbyfkd6P3UxHZ8LxGXPApU8nqMcdqCa4wHkcRjLyroIxjFi4L1czVydhZxvZxAcqyeNv03E0Jw==
X-YMail-OSG: ByX53hsVM1lPtJCy8zoa9TI0Gn5HdUlhOp6gX3nQL3XLKNNgvn6TyTXRgTPQgTh
 GvJJv6MOLCv0p4dNS4ydfswEmdO47yn_Yl2pfaSMYVxeYVxCkvC7vLDRONqufVsS8SDNqMKNOZyv
 1qpZexw1UzG5YQF2Z1b9ZM0w1y6r7M6L3HKptKaJEbrpW3a3yki.k.Z66iIkAbBoAT0xMDavM4Eq
 i_1LhVogpHyHi72FL3ICoRudytJRCxTbEuDThO_ABnGUFiW_12fbHtdakAQS1fx2HJRYq4JBCO4f
 MKoZn.W0Mi3nIp2C9rL4PZeofAyjeKWFgBeMyqOagy76r3kZzfYO2iWWNLWSIRkVNw1j40mImibn
 u32KTbqAYZANvwUPjyBLA_Ewqvwhqb5ZgnL1QZHEerEtvboyarsIQdPQVN7Xgx4YlqB3D5FFML88
 ps_PcOXjRNWlaqTsFMsd__wWfaPDySSI39ztolIjEAmBDuLs6Pku_Ze0xElynA6nBvO7mDzxwU6y
 pUfNVxUj9jJi7M2MrWD_sOfYBQgieiCCvRgc_8lQQ3NY8LSKfzWewloeA50WY765Svn8vWPaR3qF
 qfqIgLb4o6EoH0C6bwmLsNB3a3DJAZEpzF7i7qCyterWnduU4cq__I9BHGvT50oa0mkgP9hmhM_U
 J6ph07EoJ1h9tFUFH0XfEHJsyYaW9RKRZm_F8MOx_om0I9bSnYXYTSuaH2tMeuUyTnRtD3Opp0t6
 gUEzkjWlToLcyxQQQbBvVP1bvZl.Ey0mGmsuZO3w3UMXDNMFulbVXSNeP2.QAHBy1I4fh5zUb5Nv
 MrTqJBtkEVKExNI.jQd1mfr1Gd8dxXtcQISx00qBAvWWTHrS97JWLgwIwO5ad5QIgst91qolrarh
 Xmj.WjUnIX2tT9NM1UgXbSL4CndBABlbwa1Tncof51ZVNi8nwpQxhQLuLUyibuv11OrioU_QuHAY
 1cbrl.dv0bIYJUCQ.AXB60jlK.2GgtPKXOpAr_RKmLTl8tTpBRuwdep0rsbr1rAH2d3jU2Y6nApD
 WzzdurqqYK20_otgQZBvnIcxQZwJB6H5viH00bmmeszWuFHnJRBYVB_iQiCBkV9.KTtb.nQ6wQPC
 NAD44bdxA4EH5jTf6VLsecF_RahXhEl6TksV8aBmvQRtbEe3zsZrwbWVVhx0zw8DPc.EPy53.1To
 JtsccF4g7qkJ7OO9W_CClbELfqTR7zeoghkJUxcVMrJWW4fJYpN4r3XvFKm8uDI9vOq5GEsdClQm
 lpVkDuVTnniA_4XSUrw44.9mEUxQfE5ljjfQIKELqNzgv7YIVHROnk7x962uZHc2x77kc7sK6LX6
 8bI7_RqyD6SRxiUP9qo8vUKdq.LYUg5Kn4t3RV5ln7N3YVmhQ8WXmlIOs93XI0PAz7rH_X8m3ZFX
 Pg1JpK96SDlojxORix8dzzfuc8Y_ZcZT_FOvlawX4EFv_bwIR_2sG2mJ08kFvujjwyClzoMr3RFo
 UXhM_8HeQo9Kv82w0uQZEYM38LgMJTIkUY0fgNLHq.69YZfun66DiEJo4Wlrs3e.7N3WMg0wIx81
 Xkwicy_zV.MyRhhHLKjJ62Nyp_zwWwiLOw5zZu9JlK3Q8ngIRIiXRev7X9rQofXO.LetDbCs1GZP
 3TQP6x54Hzg7n4TDHworvyjHhiZyKi6H7jhDLCqF81W5dN9DVzLAZRiQ6xRlzulKlGX1w.YJxHRn
 CoO5DpVL1V5fqPw5oQByWx2iyWWVTSQX1KQo6ivX6LvvBG64PWaOoztAek.6Uw41HLZN5USmsiMd
 BV8OCq3.SQAIAoESWYBoeCy.9qkOe0G8soyavCi88Ww7px2Bq62Hrdhy4sLKVwsTqdWqojqEM._A
 j8PGhYJGKYKEIw05mf.qBoufznPrIAhRU9L96UPAPSDFRjF_Lb1hYcU7O2MWfSdjly7e2co9_3Fg
 bUKIo_K8OAnC_4Tw7nphtxlkEvd4SWqc0arEsrLsi4Jl6SFQlvV8VSpubX5GC6LSl7ushEIjTmV4
 lXEmuBN8fx_YbEpZ.gGusPKdDwtRGETALStLvZrZZwZPF9FioTGyaCsoNQq0Vl2eOPcYkqv0IJSr
 7G0.ZXPGDGJ6viqXQgdTpzXEuUR6Rnz40kDK6w8dsowYiwP8Kr_ft0nxFfLTpAXgawBmC6QHYCpk
 oNyGV2IrSYWd4s0p2sbsPrpAsmqu.Al2LGILpXB8UupfuOZ_1wPTiqDdEFjX3z6ulAIvOIc7KcLF
 Jj_PycKXMM_MwAZos4eeTSMy_UhNT6GM4DTS.fFofRWsz7XedYSNGtS3YLwdQClhCZifTQtiC8jH
 GYw--
X-Sonic-MF: <nruslan_devel@yahoo.com>
X-Sonic-ID: ea7e4a78-4c94-4d9a-909b-b96f67d8b373
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Tue, 20 May 2025 17:12:50 +0000
Date: Tue, 20 May 2025 17:12:45 +0000 (UTC)
From: Ruslan Nikolaev <nruslan_devel@yahoo.com>
To: "kailang@realtek.com" <kailang@realtek.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"sashal@kernel.org" <sashal@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>
Message-ID: <1337059899.270541.1747761165293@mail.yahoo.com>
In-Reply-To: <362743264.827582.1747131928735@mail.yahoo.com>
References: <bug-220109-229339@https.bugzilla.kernel.org/>
 <bug-220109-229339-9HzhKc5gL2@https.bugzilla.kernel.org/>
 <362743264.827582.1747131928735@mail.yahoo.com>
Subject: Re: [Bug 220109] Audio disappears on HP 15-fc000 after warm boot
 again (ALC256 code path)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.23840 YMailNovation
X-MailFrom: nruslan_devel@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2NRYBPHKLO4QCZCD2R6UGTEUIUV5DQI2
X-Message-ID-Hash: 2NRYBPHKLO4QCZCD2R6UGTEUIUV5DQI2
X-Mailman-Approved-At: Wed, 21 May 2025 20:52:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NRYBPHKLO4QCZCD2R6UGTEUIUV5DQI2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Kailiang,

Just want to follow up and ask if any other information is needed.

Thanks,
Ruslan


On Tuesday, May 13, 2025 at 06:25:28 AM EDT, Ruslan Nikolaev <nruslan_devel=
@yahoo.com> wrote:=20





Kailiang,

I added alsa-info outputs to=C2=A0https://bugzilla.kernel.org/show_bug.cgi?=
id=3D220109 (see attachments for both the regression and reverted changes) =
by following your instructions.
Please let me know if there is any other information you need.


Thanks,
Ruslan



On Tuesday, May 13, 2025 at 02:30:17 AM EDT, <bugzilla-daemon@kernel.org> w=
rote:=20





https://bugzilla.kernel.org/show_bug.cgi?id=3D220109

Kailiang Yang (kailang@realtek.com) changed:

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 What=C2=A0 =C2=A0 |Removed=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |Added
---------------------------------------------------------------------------=
-
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC|=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |kailang@realtek.com

--- Comment #3 from Kailiang Yang (kailang@realtek.com) ---

Could you run alsa-info.sh to dump codec info?

Please do =3D=3D> echo 1=C2=A0 > /sys/module/snd_hda_codec/parameters/dump_=
coef

before do alsa-info.sh.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You reported the bug.
