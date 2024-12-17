Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF5F9FDED9
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Dec 2024 13:56:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03EA960504;
	Sun, 29 Dec 2024 13:56:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03EA960504
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735477009;
	bh=V1jcZ6R1gH6eBa4qDHGHFs+5MFtdTzQ/bXOi3Pw0ZWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C+BSxLqwqrct0lNOm+vnIxftqeZEOTYG7+5Gxlz9DifnhI7DajCcwHYcgmaUKrpzL
	 Oumavv+slpoCwN4V7dVhYuOVcCi2jIEQkZ4nzr//esbRnCDofy9/mHFUdm20rijs0b
	 POxelyS28BNVG2xvQktluG/fRgB6uniFhMOCfjIU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 000D5F805AF; Sun, 29 Dec 2024 13:56:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE7F3F805B6;
	Sun, 29 Dec 2024 13:56:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAB06F80238; Tue, 17 Dec 2024 11:22:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HTML_MESSAGE,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from f159.i.mail.ru (f159.i.mail.ru [45.84.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD2ABF80017
	for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2024 11:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD2ABF80017
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=mail.ru header.i=@mail.ru header.a=rsa-sha256
 header.s=mail4 header.b=iH+lyn/y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4;
	h=References:In-Reply-To:Content-Type:Reply-To:Message-ID:Date:MIME-Version:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=/e+rZhvcHP4RwqOW6s1/zM0n+0HWrUKOGyi8AxTXRIU=;
	t=1734430936;x=1734520936;
	b=iH+lyn/y6mvPnZag4KDy0LjixiYWaaGmeT8/SPnTg/kLOP9qOIFtugWgGe7DAqcUOIdFpjHmk6B0g+Pe4k/cNcvMihcjhFyK/7xZu3surx3mn2QvWfXi5U9LxtcdhCBeOqDoSDv0KnHH4U3MkNGwsGDhOvFx1sFp9XpzrDbpEwj6v8xd+B7tCNbhhapmpuWk8bTn/ba7VQCte7mFrXP/81M4/mmqAgmsLKDQ81WiHjcT2BlNlPwRBjYuF2FPsHlwIDWbL6F2IxPWYHIDaZvYhT9Gdm2mWo/5E2eVAxV+5jbOhGZ0opFo3uwK/YwU76cWsetDxcwcSb6o9Q1RmKAhbg==;
Received: by f159.i.mail.ru with local (envelope-from <end.to.start@mail.ru>)
	id 1tNUiN-0005Pi-GZ; Tue, 17 Dec 2024 13:22:08 +0300
Received: by e.mail.ru with HTTP;
	Tue, 17 Dec 2024 13:22:07 +0300
From: =?UTF-8?B?Li4u?= <end.to.start@mail.ru>
To: =?UTF-8?B?TWFyayBCcm93bg==?= <broonie@kernel.org>
Cc: Vijendar.Mukunda@amd.com,
	mario.limonciello@amd.com,
	Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com,
	syed.sabakareem@amd.com,
	=?UTF-8?B?TGlhbSBHaXJkd29vZA==?= <lgirdwood@gmail.com>,
	=?UTF-8?B?SmFyb3NsYXYgS3lzZWxh?= <perex@perex.cz>,
	=?UTF-8?B?VGFrYXNoaSBJd2Fp?= <tiwai@suse.com>,
	=?UTF-8?B?Smlhd2VpIFdhbmc=?= <me@jwang.link>,
	=?UTF-8?B?b3BlbiBsaXN0OlNPVU5EIC0gU09DIExBWUVSIC8gRFlOQU1JQyBBVURJTyBQ?=
 =?UTF-8?B?T1dFUiBNQU5BR0VNLi4u?= <linux-sound@vger.kernel.org>,
	=?UTF-8?B?b3BlbiBsaXN0?= <linux-kernel@vger.kernel.org>,
	alsa-devel@alsa-project.org,
	=?UTF-8?B?VmVua2F0YSBQcmFzYWQgUG90dHVydQ==?= <venkataprasad.potturu@amd.com>
Subject: 
 =?UTF-8?B?UmU6IFtQQVRDSCB2Ml0gQVNvQzogYW1kOiB5YzogRml4IHRoZSB3cm9uZyBy?=
 =?UTF-8?B?ZXR1cm4gdmFsdWU=?=
MIME-Version: 1.0
X-Mailer: Mail.Ru Mailer 1.0
X-SenderField-ReMsg: 17338422902098039538
X-SenderField-Remind: 0
Date: Tue, 17 Dec 2024 13:22:07 +0300
Message-ID: <1734430927.112015823@f318.i.mail.ru>
X-Priority: 3 (Normal)
In-Reply-To: <173384228352.64342.12647978237032666087.b4-ty@kernel.org>
References: <20241210091026.996860-1-venkataprasad.potturu@amd.com>
 <173384228352.64342.12647978237032666087.b4-ty@kernel.org>
Authentication-Results: f159.i.mail.ru;
 auth=pass smtp.auth=end.to.start@mail.ru smtp.mailfrom=end.to.start@mail.ru
X-Mailru-Src: fe
X-7564579A: 646B95376F6C166E
X-77F55803: 
 119C1F4DF6A9251CD125A10E33DE5D6CA3982F4877B425559963229313A008C48FD872164937FA4CEA89E13FB360D54ECDE3041A9F545086C57630F5BF5142AC75AD20697C07A901
X-7FA49CB5: 
 70AAF3C13DB70168C09775C1D3CA48CFF855EA1345638424B2086D80B0504778CF19DD082D7633A0587C8798DFFB2F5764CD17681C2FEB7A1661749BA6B97735E5540C59287316AFC4224003CC83647688BEEADF207C7462BFD28B28ED4578739E625A9149C048EE1E561CDFBCA1751F5644E22E05AA81AEB287FD4696A6DC2FA8DF7F3B2552694A4E2F5AFA99E116B42401471946AA11AF1661749BA6B977350F1463317FA92A598F08D7030A58E5AD1A62830130A00468AEEEE3FBA3A834EE7353EFBB5533756690B632A54461F0DD561840FDDA3B5C008A6687935BE721D81DF9E95F17B0083B26EA987F6312C9ECB1593CA6EC85F86DF04B652EEC242312D2E47CDBA5A96583C09775C1D3CA48CF17B107DEF921CE79117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE70F3DDF2BBF19B93A9FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F4D043015D4838551156CCFE7AF13BCA4B5C8C57E37DE458BEDA766A37F9254B7
X-87b9d050: 1
X-C1DE0DAB: 
 0D63561A33F958A5D7A0CED643AE5F252846D652C78C6964841AE923EA40F7FDF87CCE6106E1FC07E67D4AC08A07B9B0DB8A315C1FF4794DBDAD6C7F3747799A
X-C8649E89: 
 1C3962B70DF3F0AD75DCE07D45A7499577DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D3414C91BA6844B96CA454CFABFB752BB22C988E964E492C4F8457F70706178E85E834341F986844F031D7E09C32AA3244C9E1B203E558DEB13834A3C0DFA56311063871F383B54D9B36F2D855F7256B253B6C6411D86935C89E2C6D0B03718470011294B90697DA1CBF0A6D2C91ED28CB6
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u8Y3PrTqANeitKFiSd6Yd7yPpbiiZ/d5BsxIjK0jGQgCHUM3Ry2Lt2G3MDkMauH3h0dBdQGj+BB/iPzQYh7XS329fgu+/vnDhmJyPn51QCmelHXC5B6/bxQ==
X-Mailru-MI: 80010000000000000800
X-Mailru-Sender: 
 6776CAFE5C51432926FFEFAB89CEBF7B8DF5E5D85AD09EF1CDE3041A9F545086273BB56AE6A342480C989E2F67ADEFF503C2AB756845A12E3F19AE7352BF46025A92E71CC7C3152D8D05DC8E9113C1AAE08AD13A84CB3945440A67913D6ED084D7A14DD9E34ECE7467EA787935ED9F1B
X-Mras: Ok
X-Spam: undefined
X-MailFrom: end.to.start@mail.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DCCXUIXVCYWOFPG7WTKQ5II6NEIZEVJH
X-Message-ID-Hash: DCCXUIXVCYWOFPG7WTKQ5II6NEIZEVJH
X-Mailman-Approved-At: Sun, 29 Dec 2024 12:56:08 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=utf-8
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: =?UTF-8?B?Li4u?= <end.to.start@mail.ru>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DCCXUIXVCYWOFPG7WTKQ5II6NEIZEVJH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

CnRoZSBwYXRjaCB0aGF0IGhhcyBhbHJlYWR5IGJlZW4gYWRkZWQgdG8gdGhlIGtlcm5lbCBicmVh
a3MgdGhlIHdvcmsgb2YgYWNwNnggYW5kIHRoZSBtaWNyb3Bob25lIG5vIGxvbmdlciB3b3Jrcywg
c28gZmFyIEkgYW0gbG9va2luZyBmb3IgdGhlIHJlYXNvbiBpbiB0aGlzIHBlcnNvbidzIGNvZGUs
IGJ1dCBpdCBpcyBvYnZpb3VzIHRoYXQgdGhpcyBwYXRjaCBicmVha3MgdGhlIHdvcmsgb2YgYWNw
NnguCsKgCsKgCsKgCsKgCsKg
