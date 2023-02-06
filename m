Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D400568B763
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 09:31:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C8AF1ED;
	Mon,  6 Feb 2023 09:30:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C8AF1ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675672300;
	bh=XkiBppBiIGQdLDHhwFlK1XOAqy+D5oUzH8XdOSMWNUs=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=d0tMcNPGRZgytUYbXVo9LzqBWkRbgx4/a+G9nZPuXTUFPgAZYsfnQVuiGtka1uWxN
	 o0jaXoeobRmISo3glswybo80PipTHRpeALSaOVrSYuYkcnU1EsWGNdcXQcouJnxufd
	 fszr88mq85FmwPU+OC4MFr8hiVlPqj5CqDAN4zg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13293F800E3;
	Mon,  6 Feb 2023 09:30:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7B09F804F1; Mon,  6 Feb 2023 09:30:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2222F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 09:30:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2222F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SNEwGb9P
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 75D241C0012;
 Mon,  6 Feb 2023 08:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675672229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMj5Fs+cE7htz9baKVtZ700BYz9yyPIfXJqXxrqoEi4=;
 b=SNEwGb9Pn9HOlCtzKReMZNxO+N3A3DzDLn4rSE1lREh4Z5ybrWudDu+Qeky0Bnj4EJQe46
 7LspwC0yNko51n52GuRycvGg0NFbqR6NVdIciW1TCZSp9pAEB4WEwLI8yWOskN+S/11UDx
 SFruYQ/YqOC80gNV39hVpAIySvDCpN5lmU3KKTtdxJFqEAbzgk0pLUKX0EjSzUQ6dLN2h7
 JNhHlbNDcnyzA0uGh0uc9HA4AdkyrEd5S2wEGY8ElYRqBLM0KA6DSYYq4oXPtbFS69U4Bx
 yK4gs3Z8mfOUhhK1RegMGagcHvfQS7CPz0O6OjP0BuoMaF5kxlQnNwNaYL4TYg==
Date: Mon, 6 Feb 2023 09:30:26 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: codecs: Fix unsigned comparison with less than zero
Message-ID: <20230206093026.6236eea2@bootlin.com>
In-Reply-To: <20230206075518.84169-1-jiapeng.chong@linux.alibaba.com>
References: <20230206075518.84169-1-jiapeng.chong@linux.alibaba.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, broonie@kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon,  6 Feb 2023 15:55:18 +0800
Jiapeng Chong <jiapeng.chong@linux.alibaba.com> wrote:

> The val is defined as unsigned int type, if(val<0) is redundant, so
> delete it.
>=20
> sound/soc/codecs/idt821034.c:449 idt821034_kctrl_gain_put() warn: unsigne=
d 'val' is never less than zero.
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D3947
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  sound/soc/codecs/idt821034.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
> index 5d01787b1c1f..2cc7b9166e69 100644
> --- a/sound/soc/codecs/idt821034.c
> +++ b/sound/soc/codecs/idt821034.c
> @@ -446,8 +446,6 @@ static int idt821034_kctrl_gain_put(struct snd_kcontr=
ol *kcontrol,
>  	u8 ch;
> =20
>  	val =3D ucontrol->value.integer.value[0];
> -	if (val < 0)
> -		return -EINVAL;
>  	if (val > max - min)
>  		return -EINVAL;
> =20

Acked-by: Herve Codina <herve.codina@bootlin.com>

Thanks,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
