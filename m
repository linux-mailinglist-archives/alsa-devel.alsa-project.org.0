Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE93B068A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 16:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4985A166E;
	Tue, 22 Jun 2021 16:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4985A166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624370910;
	bh=bsBPYTaxy08D1uqyOc+4bECTpfTmYlBS49B5C2H0ONc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SbiJ/6uq8UUxpfM2gxBuPZCCoJljGTU5C6wSdkYmp857ZREfm0Ovn3cQUTgVMgAXP
	 5qzaHclXVt4C4nH+Ag2Csg7LyDy50dOdOIJIk5AFuc11XnNoKXgJN2TreAU2lCqL6r
	 CM0Xa2KzzFPZF4+s/jHlR0UTEhlG0SOyhzoDwV8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C750CF8026A;
	Tue, 22 Jun 2021 16:07:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD56EF80268; Tue, 22 Jun 2021 16:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0D92F80137
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 16:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0D92F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TPe5aCgD"
Received: by mail-ej1-x62b.google.com with SMTP id ji1so28673806ejc.4
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 07:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lp53Y0gTyDe3jcN5tHsholxiEow8xex6nP+9fTMsVuw=;
 b=TPe5aCgDJqRdLqihIk7FWGHy+EQ0p8K06/88hnNL5HjOXaw+W3Wt5hm/d327/bEFW3
 pH2lZF8M0YgCtDKuN4XLUaWCRlbhFf6qVqv/gGObrmMCcXXTYOcpwF3aYb1ZPQNzdZF9
 zYDIhcfDv5wMpT37ZW9ySP+ZVtQ33yHfaeoA8/w69v/twpJsErvQ9lkKqZ4jAPd3Otxn
 so9rsFNZCR6jP2sPAEpfb5vBxOwe1NaGEXPMq26z2fBeSqp8Vi09ODrKlGLTjArub4W+
 PxWFaEV5fzLiBQI6LuS1VnjgHEg6d0xN6+gj+wcb2CQ38UuiaRY1wWKs2ayclQKOJiQe
 AtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lp53Y0gTyDe3jcN5tHsholxiEow8xex6nP+9fTMsVuw=;
 b=EobqinMdQMGmFffzypvpNOGGDY0JA7TQb1sUe98HUXC1rXZ4mge3CnV5zIQnE9s10m
 jiotVkbn7+YeoalXF9TK2BEBh6q7IZexV/cZcVTFeQuOVMG1xTbAdSRgTEvDELZYsarD
 mgLsyVZNIAfG219u7E9Aub5r987bqP/rkarCD3u6CcygrrvoDBDZHKqKwgFVnrUYBcC+
 NP0RtGweXPKd2rulz8FiVRXgRuTJ7O38ujjvzkggzVdy3r+vquS2guNeKpFBOp4SySyi
 knOB+owPgUoQxNwp3NLZKxT2jyTUpEzkYj1XofQHq2IuriQQl7FCwiwn+42HhrmzhdrZ
 JrDg==
X-Gm-Message-State: AOAM533pxZ15TLBRdQa5/ZsZsWfTs7vy8iMQWfSfY+N9MwNBnGOaIyBP
 fxtKa8K4lQrmRBXHlWo8moc=
X-Google-Smtp-Source: ABdhPJwv8yq6Ze0RcRPGoACjstEosenX/SS5aFRiXKeQh+SdY0jGjk70OiXGvqJO1PsBz1I1zsuiKw==
X-Received: by 2002:a17:906:498b:: with SMTP id
 p11mr4264067eju.295.1624370810644; 
 Tue, 22 Jun 2021 07:06:50 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id a2sm6164232ejp.1.2021.06.22.07.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 07:06:49 -0700 (PDT)
Date: Tue, 22 Jun 2021 16:08:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jiajun Cao <jjcao20@fudan.edu.cn>
Subject: Re: [PATCH] pci: hda: Add IRQ check for platform_get_irq()
Message-ID: <YNHu8GxbzYStfj4W@orome.fritz.box>
References: <20210622131947.94346-1-jjcao20@fudan.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h2zYJyMj+3v5Om+m"
Content-Disposition: inline
In-Reply-To: <20210622131947.94346-1-jjcao20@fudan.edu.cn>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)
Cc: Xin Tan <tanxin.ctf@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, yuanxzhang@fudan.edu.cn,
 Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Mohan Kumar <mkumard@nvidia.com>
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


--h2zYJyMj+3v5Om+m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 22, 2021 at 09:19:42PM +0800, Jiajun Cao wrote:
> The function hda_tegra_first_init() neglects to check the return
> value after executing platform_get_irq().
>=20
> hda_tegra_first_init() should check the return value (if negative
> error number) for errors so as to not pass a negative value to
> the devm_request_irq().
>=20
> Fix it by adding a check for the return value irq_id.
>=20
> Signed-off-by: Jiajun Cao <jjcao20@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> ---
>  sound/pci/hda/hda_tegra.c | 3 +++
>  1 file changed, 3 insertions(+)

The original code is probably harmless because it looks like the call to
request_irq() would return -EINVAL if irq_id was a negative error code.

But checking the return value is still a good idea, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--h2zYJyMj+3v5Om+m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDR7vAACgkQ3SOs138+
s6EXFg/9GSl5j8r97IeAHv15Y7wlUZPx43jh/E8tpLotlfxlkQkYJAwI/4JKfU7l
4/AHaUQN3nJfx1ShlhMRSozHp5d/gTwmKOFYihWe7up8uUkVFtZgv1YxyGdW5JL9
rR31Mgf3GYYz+w0HN4KxMd29qosCeCWWPLv62LTn5vh2KkMOxlawTNn4ArNAc6iz
qKv1QAg/HSmHuX0a0g3udOB93avUJkoM53aDhxi7pp7GeR4abWgBUzzV37cD1Y3p
HbjOZScoye0gKVifvHtIwiMuMadXTApO1dByN76hxLVYSo13DQWIsjYFQPXoTwZ9
aqkojGAyFYpYpvuxzOy+qUK6ENAKcKKIm7agsMRWUEGR1mJfFlQciwsUXw7aaLmP
7q5/eLiMydGyfbfG4aNTty13Wu8XNjzNTWs7f+UFbToSJZ7FxYVQIqTc+tzDeowz
fqcduM7ECuQhCq0/RNYVtD4gAK9W9LuRutv69qifi6iUXFC/TDOZ5wg41r66BGxc
5eB821Ttk2Qkc+aHupdOqfWiPZoUmdhXseGdWAwQ878gy8k9l9mvZhj8vrEh4NzI
m/OdiDKd0pJkzqNH/1AtlpFD3zoq6QKXuivtyM4BtQJeoJqUqbVD60gx5fmyaBU7
PV7QNRerp8KRGfOxOiqo3DjEeOFzpSCCnAbkVJzlwppwSKJbGyE=
=1SPN
-----END PGP SIGNATURE-----

--h2zYJyMj+3v5Om+m--
