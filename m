Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF88315964
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 23:26:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 032F216C0;
	Tue,  9 Feb 2021 23:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 032F216C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612909566;
	bh=7kfxLK78PvfigA3R4+VMbeoeBXl7l9q8dV+Npd79hmM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IBrjbkp0W6jEWclt3u79fQe3OyPDwdxhkPcMkxrLZiV78T7ax9DiTwvBsE7mmBKGo
	 bOJrpD+7ooi6E4+hmcKVepx1QJhSNuMiyrGj82y4pgU9oEY6KUnl/ZTpfq1y9dkELH
	 JT9JfyxrJbaxO2R7o3xa4L6hkpzXUAOigYv31ZiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 212A3F80165;
	Tue,  9 Feb 2021 23:24:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8DFFF801D5; Tue,  9 Feb 2021 23:24:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4399F80107
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 23:24:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4399F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bytmFa9s"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64C7764E56;
 Tue,  9 Feb 2021 22:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612909463;
 bh=7kfxLK78PvfigA3R4+VMbeoeBXl7l9q8dV+Npd79hmM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bytmFa9s0GNPrj/vhul83Yqfc3J2cbXfknvlwBAwsnb9RN3uOX0U7HT98gqG6CwvO
 v/MzX/xnG504FWaN6fs4kkZPHH7xYxyhfTrwmqsN01qzlR5OiLBihoJXk/cuNL1vl3
 BRqfW8oTcoQHRV7MlKZOETUvNHsRyXEMuR0NXtNj3DbPjXvzGgYGFwPcOEdqC4i3zU
 GyGkZglpS+dtRTRlKy0xv3HpibI0MX10PwNGuX+ThaeG6cIMdO/L1VvhzY30L4sw1n
 8G8oq5BU+KTGQ6wdqAYpcScn+OM4Jq50T0zHrpDpUUJ+ILUc/5DEaTZR+zUjfEvTxa
 W81VBLUwB4T0Q==
Date: Tue, 9 Feb 2021 22:23:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: change error message to debug message
Message-ID: <20210209222331.GD4916@sirena.org.uk>
References: <1612771965-5776-1-git-send-email-shengjiu.wang@nxp.com>
 <b7f5442d-ad21-eb8a-7d90-7a8207320541@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Content-Disposition: inline
In-Reply-To: <b7f5442d-ad21-eb8a-7d90-7a8207320541@linux.intel.com>
X-Cookie: Put your trust in those who are worthy.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com
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


--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 08, 2021 at 09:06:44AM -0600, Pierre-Louis Bossart wrote:

> If you demote this to dev_dbg, we'll have to ask every single user who
> reports 'sound is broken' to enable dynamic debug traces. I really don't see
> the benefit, this is a clear case of 'fail big and fail early', partly
> concealing the problem doesn't make it go away but harder to diagnose.

Don't you also get the same information out of the DAPM debugfs or did
I misread where the error is generated from?

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAjC2IACgkQJNaLcl1U
h9DwFAf8DLNKdQrHOYHHu+fNRUcqtMVhFvVVF0+cfmG9XU5BbkLm99NYsC1DZXFR
gesRhVjscehAl32rdW26yebEpK25sZ/yivEnPTmgmk/Y+jRzGRHQhAu2wowQtBlO
bJrqcsb72F4oYduMlICmRI9cya3AnWDwlQh5tX6iaYoQT28jM/KqtN0SYWQl9b0Z
ASTnP0KDq9M8nb5PftaVzKa7QGw+owjzxg5aZoEdqs1GuBFJOXJFQKk22b3vUl9S
OUb9tqhjJckUoKWm7mMs5lF3TI6nZHXxRuvBKPxlgLmfyYUkf87ld6oqGzKF7Av5
wLxjnJveFW0YK1Pmj4Es65nSBVdTOg==
=8ykL
-----END PGP SIGNATURE-----

--J5MfuwkIyy7RmF4Q--
