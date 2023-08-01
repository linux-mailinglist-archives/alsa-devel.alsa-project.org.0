Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A28E76B92E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 17:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89542827;
	Tue,  1 Aug 2023 17:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89542827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690905332;
	bh=9JFm6fP+e0z1kdDwkpZBNbLaX6TbnXIFf7qwn0IWDcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IlZZF/aqywN6Xv5dLkAEwL1jil+UlUtWskVuzBzzUM/L97YlQj8cuiD061aiUL3Nw
	 pfgvtlGo3Z85ogHxjhfsRoLkyACNGt8vFmH2DUL9Fa6XW34Hh+2tH2T8WooT1bA7nC
	 l5s1z5orJbsBclmJLL5p0dIfW06gFvOI69UdKNz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 592FEF802BE; Tue,  1 Aug 2023 17:54:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 289FFF8015B;
	Tue,  1 Aug 2023 17:54:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E9F9F801D5; Tue,  1 Aug 2023 17:47:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RDNS_DYNAMIC,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out203-205-251-60.mail.qq.com (out203-205-251-60.mail.qq.com
 [203.205.251.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCDEDF80087
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 17:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCDEDF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=WWBdyiLf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1690904800;
	bh=eYwIMN8zci6nGIsOM5BuWbHyBjNGPZrgg1JUL0HjpGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WWBdyiLfmVzUhhtq9II3H9qx7ncMWRZz9Dql31Zcw2dWADGnbCt5NyKrbWsNsg9OW
	 4boZ6YpWPa16GH4WWLf0n43045kHlJCr34uVaDw3Xf5zvZHUfTvPt/wCm9eT71QYcz
	 VRgi65+R7JjTclKtVRdRzrPPtEU/u89yCx3JEhKM=
Received: from localhost.localdomain ([220.243.131.5])
	by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
	id BA435424; Tue, 01 Aug 2023 23:46:36 +0800
X-QQ-mid: xmsmtpt1690904796t7m92r9cy
Message-ID: <tencent_5E8D53EDF5D61E189A478942372A8C44CA06@qq.com>
X-QQ-XMAILINFO: NjrIpkS4KCMdr4uqZA74WgL3EmQd9D9SmzEtXpV7fIEb5MP5yID6FD9jVKYS3+
	 R1t54ffXFzzRN9RZ5E/UJHxSEX+uLhl3EG4xGUXfhqelewg1z8kN+LHH2V1NVfU36hsgXZFwwG4J
	 QTp0QcJonGBXQDntKLBP80Mh/ykdmmDIXf87g/UywL1Bs2bEn154xCgYRYS4WuLT/0gFxyqycFPc
	 A+lskCcQ+2a4CjTUAuSCZUZegHW4OvG6c9RAYCNi6g4MkzhE2B6PK1XWD+VYdQVl8XfSrKR7rfx6
	 qAHWLYvgfj1zdOUGWxNxEOTlqwYR3QMivPjiwtDj68lXNg2AeZXzLmAjkeKRDzshA8NL6fPCxAeD
	 lKJmhc5NuI0oQXnKtIdnA02JRm/yrdU3QKUXLqUon6IdGUxOj0klrfdjwjMQdP+pHUY7bfXlVtOe
	 huRxciisgNAmTD4Q+6xDXAXDIOOpn++CPr14niWkXNBK50Zm8WeCicbf+RRgqRG4q2b3MC4jn9Kd
	 0o3gEmGtgxwVVF45UOAkxCi33T77Pq9MoYnRFcQ9ELhCW3sOD4j2y308h7t6h+fO0oMroYZrNsQQ
	 jNoQ9PhxCyA2EnCzWoIrwP6B+LhgzHG9NhDPNU9XmqEcT3NQW4+X6xSFnnM79cHqQwS5K2hxWCK4
	 CFxP8BP+CMKKdbD19cAFuPp7m9hhQ6dkyghWmaWD4b7vwHwQKCZHpRGtRA15sxwDEYlcrERwhDuB
	 07N2Puauzy4gs9JG3BQoAJQ1R5YUe4nq5Lhhupy059up/qDAPXOaFxKaT88fjSlCFzpnwqYVz7mo
	 YCcNpgx3hqyCTeY0BdrFZZ2msJ8UxzoJl4dw3VIhHzbVhAQQOClqTg3CQwnOVyQuVKYk2Cyp3WBX
	 mTWi9s9lw0vNSEjL3RJQPfBr9axszOCchjYsRojMudYUI7DXnAVT5UEyTbkgyHmOiJlOYonKJIs4
	 Xq03XffGaYFY55r/oa4lypgUl8DZzCRXClnaOLv0+CbcJ77JtzASFVcr5OvxBA
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: oder_chiou@realtek.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt5665: add missed regulator_bulk_disable
Date: Tue, 01 Aug 2023 23:46:36 +0800
X-OQ-MSGID: <2712364.mvXUDI8C0e@localhost.localdomain>
In-Reply-To: <ZL1DUWAeBbArQL1f@finisterre.sirena.org.uk>
References: 
 <tencent_AA66A80A12D4372BB57E5B7A60471EB00A08@qq.com>
 <ZL1DUWAeBbArQL1f@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: zhang_shurong@foxmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7YNDT2NAWLSMDN4XDVEP6VZZOPX2MW52
X-Message-ID-Hash: 7YNDT2NAWLSMDN4XDVEP6VZZOPX2MW52
X-Mailman-Approved-At: Tue, 01 Aug 2023 15:54:38 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7YNDT2NAWLSMDN4XDVEP6VZZOPX2MW52/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=E5=9C=A8 2023=E5=B9=B47=E6=9C=8823=E6=97=A5=E6=98=9F=E6=9C=9F=E6=97=A5 CST=
 =E4=B8=8B=E5=8D=8811:12:17=EF=BC=8CMark Brown =E5=86=99=E9=81=93=EF=BC=9A
> On Sun, Jul 23, 2023 at 03:07:31PM +0800, Zhang Shurong wrote:
> > +	ret =3D devm_add_action_or_reset(&i2c->dev,=20
rt5665_i2c_disable_regulators,
> > +			rt5665);
> > +	if (ret)
> > +		return ret;
> > +
> >=20
> >  	ret =3D regulator_bulk_enable(ARRAY_SIZE(rt5665->supplies),
> >  =09
> >  				    rt5665->supplies);
> >  =09
> >  	if (ret !=3D 0) {
>=20
> This will attempt to disable the regulators if the initial enable fails
> which is a bug.
You are right. I will move this to rt5663_i2c_remove() in next version.



