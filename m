Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC5589BD5
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 14:42:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21B9883B;
	Thu,  4 Aug 2022 14:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21B9883B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659616964;
	bh=Dc8h4lXPsmDxSsos/j+7yqEliVIW1p/oerQvtS7WdCg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BY7Ju4tyhOk616maHqi5Nswv5j5uvP0cTwRfAAkSWgxdTu4iOqSgIdlXHLmSh+Hue
	 VWAotX5seywWdPUPbHkIw10PpIbr3eO8MZvwskp/Q3ZXAF21mXGYQyv4NkeeV4SssN
	 8INhP0h7ihf7QUVU91CO01Ov83f2ifMmOw5w48qg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E8BBF80083;
	Thu,  4 Aug 2022 14:41:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF119F80212; Thu,  4 Aug 2022 14:41:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F266F8012F;
 Thu,  4 Aug 2022 14:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F266F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GRsuPn65"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 72CE9B82529;
 Thu,  4 Aug 2022 12:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F5EC433D7;
 Thu,  4 Aug 2022 12:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659616897;
 bh=Dc8h4lXPsmDxSsos/j+7yqEliVIW1p/oerQvtS7WdCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GRsuPn65ESqnBp32JRUoDmuH6zGlK8xou9hyDdZflWicz2iUIEMP6HkB5NkWtbe/+
 JWlXBjY7yczQBjyWx6Pft9+ePBzGnA+A68/lMKhv3d5ckL5zq3Yh2S1iS7c7XtH5PL
 rHlc2GZbYX1lsjUNfLqdWFwhHAHZmAJkoZRLev7SKVHlGlfxdesblmNHkxpNURNwMa
 ONnKlZzDU1JOAH8AJms/hZqoi4OvJ8RwxTSgm02gxSyPUGR/MuxFjWVpPvn3N7gEOG
 4kt1RSAYu8ta0fpCR2JXy8G03nMZuzVnuv1LNZRleQv761DhK9hFagSMIBb7kHvxgp
 KOeh8yDsATBRg==
Date: Thu, 4 Aug 2022 13:41:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Chunxu Li <chunxu.li@mediatek.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: mediatek: Add .of_machine_select field
 for mt8186
Message-ID: <Yuu+elYxBv3xZ1O2@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
 <20220804091359.31449-3-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EPdOmWtiZ4ZH+2f9"
Content-Disposition: inline
In-Reply-To: <20220804091359.31449-3-chunxu.li@mediatek.com>
X-Cookie: Did I say 2?  I lied.
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 yc.hung@mediatek.com, matthias.bgg@gmail.com,
 sound-open-firmware@alsa-project.org, daniel.baluta@nxp.com,
 linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com
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


--EPdOmWtiZ4ZH+2f9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 04, 2022 at 05:13:59PM +0800, Chunxu Li wrote:

> +static struct snd_sof_of_mach sof_mt8186_machs[] = {
> +	{
> +		.board = "mediatek,mt8186",
> +		.sof_tplg_filename = "sof-mt8186.tplg",

The mediatek,mt8186 compatible looks like a SoC compatible not a board
compatible...

--EPdOmWtiZ4ZH+2f9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLrvnoACgkQJNaLcl1U
h9CJ+wf+NC3QV3rzYT893qKD9jkvsm37SLmwNK0cEbtOpP0ohpK2gakhRwXQzh+B
/wS1eGl0aXdtaxOkKueZwXQONVV7MsnuxuGXwyHFrcPwfuVICQPm1vQWwSLmBcS/
iUmtW8SSN++aMZwgYEUAJiFmbMDl5eH/gHTdn9y5dFi+9yQkE2Rw9uieV8eNfrZD
GBhv0YHtv687Q8VOL3FXafwlw5qruOIUYZ6ixEYoalp/rajx1CNxta++q+nse1KV
mDHHEdY4xb84FDeKV/VA8UTHICqp6NYIQgLoRyWkk7n1wPEvSebxTpGJJGoBVabe
RhAhhFa0pZfWYE5UBgEJ9BOpBQCsCw==
=zf1M
-----END PGP SIGNATURE-----

--EPdOmWtiZ4ZH+2f9--
