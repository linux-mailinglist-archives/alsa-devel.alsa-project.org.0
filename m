Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D30C59FDEDA
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Dec 2024 13:57:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 634B860533;
	Sun, 29 Dec 2024 13:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 634B860533
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735477023;
	bh=6GaLA1X9YBxNmmTMlT7ct1o3M0JaZQscXi1hJCk3KnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BH5qHQOwVbfW6aO9ssm0fku0A5WDjzfbun47mU7KrtONUTnJ2gIddLaHWN+a5XV+G
	 JEUJsXIj9Zvp4cL/5W7IuGcudITtVZjj/t7DfnQlaSAMKMaJJSwV7foKVPqERmC+5x
	 ppaxH4R8HUYHlU4x09BYvh/2QpjS+7Fr4U5EAumk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48E92F805E7; Sun, 29 Dec 2024 13:56:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2F9CF805DF;
	Sun, 29 Dec 2024 13:56:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C62C0F805AE; Tue, 17 Dec 2024 17:02:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HTML_MESSAGE,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from f174.i.mail.ru (f174.i.mail.ru [45.84.128.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9886AF800E4
	for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2024 17:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9886AF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=mail.ru header.i=@mail.ru header.a=rsa-sha256
 header.s=mail4 header.b=iCjUJAqw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4;
	h=References:In-Reply-To:Content-Type:Message-ID:Reply-To:Date:MIME-Version:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=JxHkzAN/HGdIg+gMUuR5uEkFNwwKJCZDdK+M2Muly0s=;
	t=1734451360;x=1734541360;
	b=iCjUJAqwzbQ76zJR3B0mRUdkJu3kxUsr0u2/B0ncayq6eYeG3HqU0cfvfEFOewEi82N/5WQA60hUdJ9lmVUjxp00nMQsDVGNXucQtCHoLoRFYuomMC4EqKXIeX363+mC88dsVsE2bcwvT0vaCwNoC5Qc5hr8bfIhol3bjxqBx9M02JXQn3j0hl0s+DWiR//d+IJzGAROIQWV9zVrgcle/pNVulBDVA/0Q6mUdOV5uU3Srs0S0s1VVFIHm6lxvslBlHGSSejiNmELfS5kWqocW5+lWmxS38yc43xjC2lrizXUEgISSn1z45jzIzXUntIl4ZBRL4By9KR2hUhpZ+6Eaw==;
Received: by f174.i.mail.ru with local (envelope-from <end.to.start@mail.ru>)
	id 1tNa1q-0004Jh-8X; Tue, 17 Dec 2024 19:02:35 +0300
Received: by e.mail.ru with HTTP;
	Tue, 17 Dec 2024 19:02:34 +0300
From: =?UTF-8?B?Li4u?= <end.to.start@mail.ru>
To: =?UTF-8?B?cG90dHVydSB2ZW5rYXRhIHByYXNhZA==?=
 <venkataprasad.potturu@amd.com>
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
	=?UTF-8?B?TWFyayBCcm93bg==?= <broonie@kernel.org>
Subject: 
 =?UTF-8?B?UmU6IFtQQVRDSCB2Ml0gQVNvQzogYW1kOiB5YzogRml4IHRoZSB3cm9uZyBy?=
 =?UTF-8?B?ZXR1cm4gdmFsdWU=?=
MIME-Version: 1.0
X-Mailer: Mail.Ru Mailer 1.0
X-SenderField-ReMsg: 17344316961560962851
X-SenderField-Remind: 0
Date: Tue, 17 Dec 2024 19:02:34 +0300
Message-ID: <1734451354.779698619@f140.i.mail.ru>
X-Priority: 3 (Normal)
In-Reply-To: <e5a42dbb-ff8e-486d-ab2c-66798af1fd80@amd.com>
References: <20241210091026.996860-1-venkataprasad.potturu@amd.com>
 <1734430927.112015823@f318.i.mail.ru>
 <e5a42dbb-ff8e-486d-ab2c-66798af1fd80@amd.com>
Authentication-Results: f174.i.mail.ru;
 auth=pass smtp.auth=end.to.start@mail.ru smtp.mailfrom=end.to.start@mail.ru
X-Mailru-Src: fe
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 
 119C1F4DF6A9251CFD2E7A85F12C0270F48839BB578DBE0D725FD102E0D1DB3B8FD872164937FA4C657BD2BE06F6DCD3B0229A293FD4DF54408C1983217FD6B8C9D6E12E951C28F8
X-7FA49CB5: 
 70AAF3C13DB70168C09775C1D3CA48CF624A607738C173ACB2086D80B0504778CF19DD082D7633A0587C8798DFFB2F5764CD17681C2FEB7A176DF2183F8FC7C003AD617399B518ABC4224003CC83647688BEEADF207C7462BFD28B28ED4578739E625A9149C048EEFF6E7B3EFBC51BC70B8ADF238913687CB287FD4696A6DC2FA8DF7F3B2552694A4E2F5AFA99E116B42401471946AA11AF176DF2183F8FC7C081C4E570E9C9D5568F08D7030A58E5AD1A62830130A00468AEEEE3FBA3A834EE7353EFBB5533756690B632A54461F0DD53EC4EAFA5E84A3F14CCE63FAAAFC8871DF9E95F17B0083B26EA987F6312C9EC33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583C09775C1D3CA48CFCA5A41EBD8A3A0199FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3E478A468B35FE767117882F4460429728AD0CFFFB425014E868A13BD56FB6657E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637E9CCD99A55AEBEA0EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 
 0D63561A33F958A5EA1993DC890ED60C01E5A09F00CDBFE964038D3E965424E8F87CCE6106E1FC07E67D4AC08A07B9B0A6C7FFFE744CA7FBCB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADE2815F1F17DA7190F22D334B9B612B432CCB5A6D6581D03D0776B5B2C279835F17BCBE6708A5A68D02015372BE9702A2DD2BC44A9096A0ECADA98254AA07C1209FFB34AC6A4FD911DC87653627DF1A757935077AEE5390ACCE9253A3F4078F93F49BC975E31605519BFA954FAB82486652EE4E5D9E54FDA4F32EBBB8949988C82E1024349E7D073C6328F6F768ADD8AECDED9BDAFE12291837E69C174A41D00C
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u8Y3PrTqANeitKFiSd6Yd7yPpbiiZ/d5BsxIjK0jGQgCHUM3Ry2Lt2G3MDkMauH3h0dBdQGj+BB/iPzQYh7XS329fgu+/vnDhDTafUtOJ3FsTOQqP+qhCjQ==
X-Mailru-MI: 10000000000400800
X-Mailru-Sender: 
 6776CAFE5C51432926FFEFAB89CEBF7BBD5FDD4E1C911895B0229A293FD4DF5404F7FAAEF0D5E1A60C989E2F67ADEFF503C2AB756845A12E3F19AE7352BF46025A92E71CC7C3152D8D05DC8E9113C1AAE08AD13A84CB3945440A67913D6ED084D7A14DD9E34ECE7467EA787935ED9F1B
X-Mras: Ok
X-Spam: undefined
X-MailFrom: end.to.start@mail.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EDDS7WR26FEICCIXAX3UZ6Y2A7YZH7ID
X-Message-ID-Hash: EDDS7WR26FEICCIXAX3UZ6Y2A7YZH7ID
X-Mailman-Approved-At: Sun, 29 Dec 2024 12:56:09 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=utf-8
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: =?UTF-8?B?Li4u?= <end.to.start@mail.ru>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EDDS7WR26FEICCIXAX3UZ6Y2A7YZH7ID/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

CsKgCtC00LAg0LTQtdC50YHRgtCy0LjRgtC10LvRjNC90L4g0LzQuNC60YDQvtGE0L7QvSDRgNCw
0LHQvtGC0LDQtdGCINC90LAg0LLRgtC+0YDQvtC5INCy0LXRgNGB0LjQuCDQv9Cw0YLRh9CwINC6
0L7RgtC+0YDQvtCz0L4g0LXRidC1INC90LXRgiDQsiDRgdGC0LDQsdC40LvRjNC90L7QuSDQstC1
0YLQutC1INGP0LTRgNCwLCAxINCy0LXRgNGB0LjRjyDQvdC1INC+0YLRgNCw0LHQvtGC0LDQu9Cw
INC4INC70L7QvNCw0LvQsCDRgNCw0LHQvtGC0YMgYWNwNngsINGF0L7RgtGPINC4INCy0YLQvtGA
0LDRjyDQstC10YDRgdC40Y8g0L/QsNGC0YfQsCDQstGL0LPQu9GP0LTQuNGCINGB0YLRgNCw0L3Q
vdC+0Lkg0Lgg0Y/QstC90L4g0L3Rg9C20LTQsNC10YLRgdGPINCyINC/0LXRgNC10YDQsNCx0L7R
gtC60LUgZ290byDQvdC1INC+0YfQtdC90Ywg0YXQvtGA0L7RiNC10LUg0YDQtdGI0LXQvdC40LUg
0LrQsNC6INC80L3QtSDQutCw0LbQtdGC0YHRjwrCoArCoArCoArCoA==
