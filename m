Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D36AB97E6
	for <lists+alsa-devel@lfdr.de>; Fri, 16 May 2025 10:41:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95EFF60197;
	Fri, 16 May 2025 10:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95EFF60197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747384916;
	bh=mByJZyHnoVbgoDj7cKj50tFB32dmmpq2PiatTjexJMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vU/cJYTgXRlvFpj7SyFY9Cp3y3HcDZ2V6twKCK1ne2pM7a3XDBS7Bwilp6HBikH2p
	 Cjw3V58TK7qKJhGPOru/ueMr6Y7qVBSnUZjPpgTj00zM8kcL823OVbQ6Yi5tFVBhdk
	 LfLYO/igTMOk9riLzKTp97/cXIeG+eo1V1VkKX5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F847F80254; Fri, 16 May 2025 10:41:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41E50F80254;
	Fri, 16 May 2025 10:41:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3836FF80134; Fri, 16 May 2025 10:41:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 365BFF8003A
	for <alsa-devel@alsa-project.org>; Fri, 16 May 2025 10:41:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 365BFF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256
 header.s=key1 header.b=qIwV4zuZ;
	dkim=temperror header.d=ew.tq-group.com header.i=@ew.tq-group.com
 header.a=rsa-sha256 header.s=dkim header.b=TrxXANiY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747384873; x=1778920873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xjgtN4kgUmepOJIuSppCjhjv9M19bVv4hx6TvZNIyw0=;
  b=qIwV4zuZn4nZhTREWngE66MrQ2aiU4JHg2rXiEXeAW0WXEn3zOe4AknL
   72NKut9S0/1Uh9IsZPb0aDhwHfdBGxbiYp8h00wCL9sV6TqFNx5A50A5y
   B6BFUG08iCBA6UoE/6rVhXddNUL11N8Ytl/wA2vpWtHa8/+iO8gsbU11f
   ZgQ2bQ8oM3sfheAWjc78Ze48YJr82zdlig+n5G+b+TTQGgGqw7Bip2w9e
   A9FyK5qdrUlalHKr8VhKfqwtKYCayru3lTRuh8kqHcueSu3/n+ncKYZa5
   aS8z49yncXL0Uus9/eozWwUGGNdFAT47uHYkUpTm6o93soS1EuVgau2gR
   g==;
X-CSE-ConnectionGUID: lIVEBP5MSg2kS3pK1qtcQA==
X-CSE-MsgGUID: Exw3ojnhStW8chB5T6GfSw==
X-IronPort-AV: E=Sophos;i="6.15,293,1739833200";
   d="scan'208";a="44116757"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 May 2025 10:41:11 +0200
X-CheckPoint: {6826FA26-36-3689CF63-CB8C500E}
X-MAIL-CPID: C92B7424EAFC708BAFA1E9A38F21A99B_3
X-Control-Analysis: 
 str=0001.0A006375.6826FA2A.0034,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5640216ABEA;
	Fri, 16 May 2025 10:41:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747384866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xjgtN4kgUmepOJIuSppCjhjv9M19bVv4hx6TvZNIyw0=;
	b=TrxXANiYXR67vEA7lXerUISMY3Z+TMWbJCCOtm/Ixqd7lbKCmJeR+yqJJ/Z92PPan3SYhz
	T+NOWQoF3bBoF0vrSjOMpLmiIDxG11IWqaLHAHSXUrkVSe412mpqBDT/ddYd1Cth9fGnwL
	G7Dk7/Xz84sUqDN7SKKjlqvbDJPVBz0jki4/k1ui1Ss8ZmaXbuVjUuMhaBi2eKFi2CRFkJ
	VpwoRC6D8Q81O+Ap+a4k+ftYqshLf7OS+Wgn94EAYQl3Ia0byCsgafBjx+eWMdhk7I+VYk
	UQag2kCJxC3TXnvid+y3MIWZhxU7g0asUrvMyBLJb6RW8eGPLx1TgWkRoPAzXg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 1/1] bat: Fix buffer time configuration
Date: Fri, 16 May 2025 10:41:05 +0200
Message-ID: <3051761.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250410110120.1997264-1-alexander.stein@ew.tq-group.com>
References: <20250410110120.1997264-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
Message-ID-Hash: GY3QABEVDVVUSCA2QBW5UP34B3PQZ37G
X-Message-ID-Hash: GY3QABEVDVVUSCA2QBW5UP34B3PQZ37G
X-MailFrom: alexander.stein@ew.tq-group.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GY3QABEVDVVUSCA2QBW5UP34B3PQZ37G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Am Donnerstag, 10. April 2025, 13:01:19 CEST schrieb Alexander Stein:
> By swapping time configuration some hardware constraints can be supported.
> Fixes the error: Set parameter to device error: buffer time: 500000
> hw:tqmtlv320aic32: Invalid argument(-22)
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Any feedback here? Or should I create a PR on github instead?

Thanks and best regards
Alexander
> ---
> Our common 'alsabat -Dhw:tqmtlv320aic32 -f S16_LE -c 2 -r 44100 -F 997:50=
0'
> failed ona i.MX95 based platform, while it worked flawlessly on others,
> e.g. i.MX8M Plus. Upon searching I stumbled across [1], which this patch
> is inspired/based on.
>=20
> [1] https://github.com/arkq/bluez-alsa/pull/290/commits/da78b82ff77310093=
b4b4a914d31e69b8ebb49eb
> ---
>  bat/alsa.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/bat/alsa.c b/bat/alsa.c
> index 67489c4..457e79a 100644
> --- a/bat/alsa.c
> +++ b/bat/alsa.c
> @@ -221,23 +221,23 @@ static int set_snd_pcm_params(struct bat *bat, stru=
ct pcm_container *sndpcm)
> =20
>  		period_time =3D buffer_time / DIV_BUFFERTIME;
> =20
> -		/* Set buffer time and period time */
> -		err =3D snd_pcm_hw_params_set_buffer_time_near(sndpcm->handle,
> -				params, &buffer_time, 0);
> +		/* Set period time and buffer time */
> +		err =3D snd_pcm_hw_params_set_period_time_near(sndpcm->handle,
> +			params, &period_time, 0);
>  		if (err < 0) {
>  			fprintf(bat->err, _("Set parameter to device error: "));
> -			fprintf(bat->err, _("buffer time: %d %s: %s(%d)\n"),
> -					buffer_time,
> +			fprintf(bat->err, _("period time: %d %s: %s(%d)\n"),
> +					period_time,
>  					device_name, snd_strerror(err), err);
>  			return err;
>  		}
> =20
> -		err =3D snd_pcm_hw_params_set_period_time_near(sndpcm->handle,
> -				params, &period_time, 0);
> +		err =3D snd_pcm_hw_params_set_buffer_time_near(sndpcm->handle,
> +				params, &buffer_time, 0);
>  		if (err < 0) {
>  			fprintf(bat->err, _("Set parameter to device error: "));
> -			fprintf(bat->err, _("period time: %d %s: %s(%d)\n"),
> -					period_time,
> +			fprintf(bat->err, _("buffer time: %d %s: %s(%d)\n"),
> +					buffer_time,
>  					device_name, snd_strerror(err), err);
>  			return err;
>  		}
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


