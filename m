Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 125EE55B95F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 13:42:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45A94164E;
	Mon, 27 Jun 2022 13:41:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45A94164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656330125;
	bh=7BqAs0G30YXOntcLKtXkWnGrwEEssHynkVcTXMIpM3o=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Op7F4DOgLQEr2nvX6W+MrAF6ZopSjZkN0gWx9lR//nVfPa4nO7x04dS8Hamibq3Nb
	 Ki4/9Ee0sBh+e0cKzydbjqiUPsuv0ocrMhrzKo5Bnxx2m6c6Z0RzmcoN6u+IklCgbV
	 Nskh2PqPnI4m8z0S8Txjqh6/HvxlBEsI/Vi+FWaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98377F8028D;
	Mon, 27 Jun 2022 13:41:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A61CF800E9; Mon, 27 Jun 2022 13:41:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB242F800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 13:40:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB242F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com
 header.b="WyTM3I+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1656330041;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=6gF+EtlMk3gTGWSABVOVEZv/1/nvZ6L2CYZCHCa/pVE=;
 b=WyTM3I+wnCu0BLkmHa/A4LLD7ymjUaOUKVf5tJj9LM8K10X1S2HUCZvt+SC+quTOsO
 MUVuVUQwLKz9SZdyOJrO2Ye7RONI9FMQKZYphhPyWsvhNeIClkAolNp9vQLgBPh+Kk4U
 XA2Mj/YiMjbW61rY71EzMpl+sVaaWX+cfY1vqURGjiSn166zC91Q26n8tNpP2MmrqBUj
 R/R2acqtQ927qfXAqSq3lFzeyo7fSmBJqe2JNiijeZauqqVpAAUKusuiwuMILl0owevB
 rpAgTxP7wC21UZ5YdEdKx2m/IrqJAelBml76syi+pcnh80vPE6MFXSo67Jp/7Jl2BCkh
 Fpmw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43tlAA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.46.0 DYNA|AUTH)
 with ESMTPSA id qc786ey5RBeeCnf
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 27 Jun 2022 13:40:40 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: Pandora audio using machine_is_omap3_pandora() check
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <Yrl92RILZwhQOP+e@atomide.com>
Date: Mon, 27 Jun 2022 13:40:40 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <B6EFBA88-2311-4455-82CB-3E5382C92B4E@goldelico.com>
References: <Yrl92RILZwhQOP+e@atomide.com>
To: Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3445.104.21)
Cc: alsa-devel@alsa-project.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Arnd Bergmann <arnd@arndb.de>, Grond <grond66@riseup.net>,
 Stefan Leichter <sle85276@gmx.de>, Mark Brown <broonie@kernel.org>,
 Grazvydas Ignotas <notasas@gmail.com>, linux-omap <linux-omap@vger.kernel.org>
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

Hi Tony,

> Am 27.06.2022 um 11:52 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> Hi Grazvydas,
>=20
> Arnd noticed that pandora audio is using machine_is_omap3_pandora() =
check
> that never succeeds for devicetree booting machines. Looks like this =
has
> been broken at some point many years ago with the devicetree =
conversion.
>=20
> Does anybody have an interest in fixing this driver?

we already have fixes by Stefan Leichter and Grond here (incl. removing =
any call to machine_is_omap3_pandora):

	=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/letux/sound-soc

But I don't know who can volunteer to run this series through the =
upstreaming discussions
and do regression tests (AFAIR the Pandora of Grond is broken and he has =
no replacement).

BR,
NIkolaus=
