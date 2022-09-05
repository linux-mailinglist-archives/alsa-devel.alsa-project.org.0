Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4015ACF11
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 11:45:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299F715C1;
	Mon,  5 Sep 2022 11:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299F715C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662371147;
	bh=UuiZBQrk3PkxgO4/DkhLIrDD9ZaCQxTMdt1KEb2j7EM=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uHmspEbEytiaPJjW0LVw3W13kmv2yUYPAXqh+8OOC1ofcgSkGn4tzLYk5YYt+MccW
	 T+nL5SR3ZZs206XgNpumOoEG4BauGuWOSfcRkYyIB5H7oFh3s9jv5ZIAHbXIFfvuoV
	 NpfMwHsetA+6ZyTFz7AvF3aUkwVtAsOUA+G9v2Jo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99085F800E8;
	Mon,  5 Sep 2022 11:44:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76DDFF80238; Mon,  5 Sep 2022 11:44:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B935F800E9
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 11:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B935F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="Bk/TT7cP"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1662371079; bh=UuiZBQrk3PkxgO4/DkhLIrDD9ZaCQxTMdt1KEb2j7EM=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=Bk/TT7cPidOmX6ahdFI2MrqSMRZS+vn/0NY6KUScFZzqAHQfvZvMnMp0l8sNXaJAu
 Qg/VOM876LH+AftUOPKpvCCFzGDOO2JIPsYLrp/dfuUz4DLtFp0cryr1bPvrDfgdM0
 yBSN4qQ/USJ7dzvMDKP0Bw1NwkxvFQvnjfTtzwLs=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM/APPLE MACHINE SOUND
 DRIVERS
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20220905093546.19735-1-lukas.bulwahn@gmail.com>
Date: Mon, 5 Sep 2022 11:44:38 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <4DB82E66-0BB9-4B43-917B-55E115994876@cutebit.org>
References: <20220905093546.19735-1-lukas.bulwahn@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kernel-janitors@vger.kernel.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org
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


> On 5. 9. 2022, at 11:35, Lukas Bulwahn <lukas.bulwahn@gmail.com> =
wrote:
>=20
> Commit 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver") =
adds
> a new sound driver at the location "sound/soc/apple/", but it adds a =
file
> entry referring to the non-existing location "drivers/sound/apple/*".
>=20
> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains =
about a
> broken reference.
>=20
> Repair this file reference in ARM/APPLE MACHINE SOUND DRIVERS.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Martin, please ack.
> Mark, please pick this patch on top of the commit above.

Hi Lukas, fixed here already:
=
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?=
id=3D55e2bd9c41e800638676dce3f19dcfd16b309a08

Best, Martin

