Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E17DA861547
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 16:11:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 212FCA4A;
	Fri, 23 Feb 2024 16:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 212FCA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708701074;
	bh=Y6eIDmiVmNl1Zxowb5V6ppGEIHwpZtVT+AlFM2a5we4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OnpL1j5AQbf6bozoMUyPMjWXk1Us5qUhhRtZAfxzXYxHYOJHhL1eUUdf/D2K5wJuW
	 4DRjLEntTCL5mUfXP47jxUvlqvfMyCKMbVltgovT77QIApUHPdG+4mdgjFWiqYhbOo
	 hAgHa63ICrkRxCmPuJ+6yOovJ6/GvSpB9YEk2Pa8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 042FEF805AA; Fri, 23 Feb 2024 16:10:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 220FFF805A1;
	Fri, 23 Feb 2024 16:10:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24B0DF80496; Fri, 23 Feb 2024 16:10:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id CDE65F800ED
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 16:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDE65F800ED
Received: from [192.168.2.4] (51b68dc5.dsl.pool.telekom.hu
 [::ffff:81.182.141.197])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000075348.0000000065D8B562.001DCA93;
 Fri, 23 Feb 2024 16:10:26 +0100
Message-ID: <4786204abbd7acadd27a8cf487be91e524eaa444.camel@irl.hu>
Subject: Re: PCI SSID and Codec SSID collision?
From: Gergo Koteles <soyer@irl.hu>
To: Willian Wang <kernel@willian.wang>, tiwai@suse.de
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Date: Fri, 23 Feb 2024 16:10:26 +0100
In-Reply-To: <170869932581.7.612391552809015627.273152461@willian.wang>
References: <170869932581.7.612391552809015627.273152461@willian.wang>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: PGRBKDX6UE2DT3EAYY54XL7NUNI43GOW
X-Message-ID-Hash: PGRBKDX6UE2DT3EAYY54XL7NUNI43GOW
X-MailFrom: soyer@irl.hu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PGRBKDX6UE2DT3EAYY54XL7NUNI43GOW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Willian,

On Fri, 2024-02-23 at 11:41 -0300, Willian Wang wrote:
> Hi, I'm curious about the reasons for the fixup table to be the same
> for PCI and Codec SSIDs and if the PCI SSID is usually more important
> for it to be checked before the Codec. Anyway, would a simple
> conditional statement to match these exact PCI and Codec SSID to set
> the fixup manually be enough? There seems to already exist a manual
> fix for TX300 and ROG Strix G17 there (not the same kind of fix and
> with a FIXME comment, though). I have this exact laptop model and
> would like to try to contribute to the code if it's not too
> complicated.
>=20

I think it could be simple, like this function:
alc298_fixup_lenovo_c940_duet7

Feel free to contribute. Easier for you to test.

This can help:
The output of DuetITL 2021 amixer:
https://linux-hardware.org/?probe=3D19173612af&log=3Damixer


Regards,
Gergo
