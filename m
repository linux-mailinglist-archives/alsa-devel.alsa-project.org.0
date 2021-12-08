Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E541D46DDCE
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 22:45:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7999D270C;
	Wed,  8 Dec 2021 22:45:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7999D270C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638999957;
	bh=0XzRtB1TY1B+QnDrlGDnlJEQ2jJumnQIfLZjoX0LP5w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CgaCEXYs4x7p7b78Gip4bw82NtT/83QE6INO4nNLCsgrQpTwrt1Z6nPxmPLhaSMaM
	 k/tBAm219upy8wzwLk0diE1+zeE9TWpdTYW2DYo9ty+VUoR3Im+fqH9v4TZUzO8F0x
	 ocDy/zkNECjhSpjzLoHFqBIFobajqHlfzKzD1Ow0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD60EF804EC;
	Wed,  8 Dec 2021 22:44:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBF11F804E5; Wed,  8 Dec 2021 22:44:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 498BEF800AB
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 22:44:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 498BEF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oemDuXHj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9C22ACE239B;
 Wed,  8 Dec 2021 21:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E196C00446;
 Wed,  8 Dec 2021 21:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638999876;
 bh=0XzRtB1TY1B+QnDrlGDnlJEQ2jJumnQIfLZjoX0LP5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oemDuXHj0+rmtsA9sHFzZIxRbiypNW5fjtAGq0edymKDDOt4OOXpCL0SFCi3Pjg9S
 5sk9ygS+lKu1dpnVYf0Bp2PPlMB2vOPFyk+Y0ktxQ0b08yxmxETQpgZD0RQmeRSuQd
 wQ9/LYu1jxYlwcQO0AABGD/cge3sW5oVYbPR1YEuG77vA5D9MhVcR//GNKtnqU5QEO
 O6CDirwIO6c4lQNc7PIHNvZz6alDknBXO48i4S0sU8gcwkyXveFV0COw/bbNZxBxuh
 tQ97AtM41DjaPGUdoxOO+IjU1UmdqBl3v/Wi04uXCalKm7NIZUJbW0atR/mGk7iPOk
 Z8e8LJe+XIQVw==
Date: Wed, 8 Dec 2021 21:44:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 3/3] kselftest: alsa: Use private alsa-lib
 configuration in mixer test
Message-ID: <YbEnPzSO0HKHd8uX@sirena.org.uk>
References: <20211208211745.533603-1-broonie@kernel.org>
 <20211208211745.533603-4-broonie@kernel.org>
 <b76dd5e0-56ba-79f4-21c2-ac5455d7fd65@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="H5rKt0R94ftG66mp"
Content-Disposition: inline
In-Reply-To: <b76dd5e0-56ba-79f4-21c2-ac5455d7fd65@linuxfoundation.org>
X-Cookie: Alex Haley was adopted!
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>
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


--H5rKt0R94ftG66mp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 08, 2021 at 02:27:34PM -0700, Shuah Khan wrote:

> >   		}
> >   	}
> > +
> > +	snd_config_delete(config);
> >   }
> >   /*

> This open comment at the end of the patch looks odd. Does this compile?

Yes, it's the start of the comment describing the next function, more
complete context is:

		}

		snd_config_delete(config);
	}

	/*
	 * Check that we can read the default value and it is valid. Write
	 * tests use the read value to restore the default.
	 */
	void test_ctl_get_value(struct ctl_data *ctl)
	{

--H5rKt0R94ftG66mp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGxJz8ACgkQJNaLcl1U
h9AjQAf/bJU4kSWBW6O/E5xIfDqZBeKu8sT2OqdTagdrbAos99Ph2xcdRgC8dgqG
OWCxbyF2OGGMRWRaMY7aluNIQeDyWIO4UYr84gVns3dpzx08iuIsXTmcCZ4w2S3Y
M3Amd4dnGJTz2DoASLeca6eGAply638RYIv3HwW9G1uelOmC+JKT0G4TdO2WJHN1
IBItLrGNCcu7Qrq9s2f8k+MWcROd8ezumzV4+pIKOWuL0GjyDzLWAMBpNvRaginL
XLuYvIqv+oA1OdSyra/q9DuftLLg2g4oZqiuMnAy4WFE7CofemAowR/AHyYyQiuz
GcT9xi+/0HJYkG/phNQoe+VnXQougg==
=Z71+
-----END PGP SIGNATURE-----

--H5rKt0R94ftG66mp--
