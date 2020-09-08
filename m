Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BC32612C8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 16:35:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99E771780;
	Tue,  8 Sep 2020 16:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99E771780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599575754;
	bh=P6Ih3ybR3Q0tpfGmAB9O9MzAREGP8DJDgLwT78Y8q/s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GCktAHXT2ED/tvD1E3AZLTHHKYEkyVOZVJNUCCl7dCy/5gkkbEZfbSDs6PAu2Q9fZ
	 P6iORwWe0RIanbFXfTx1P5OAktY65aqTC/0pJbBKuXfx9Th47Mx7lHVy8KAoHgsCBD
	 rM03KfghEBzbE30E6Af4S1/6nAJppw96ZsxJTdRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99728F8015F;
	Tue,  8 Sep 2020 16:34:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CDB9F80264; Tue,  8 Sep 2020 16:34:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D337F8010B
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 16:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D337F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SQbbjUN0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1483322A83;
 Tue,  8 Sep 2020 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599575637;
 bh=P6Ih3ybR3Q0tpfGmAB9O9MzAREGP8DJDgLwT78Y8q/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SQbbjUN0w2+++8eS4F2+HqX3/5wupr6MhkPYnfoLTICk9jCZc7nzEsOvAqjGd64Jq
 9Ad0YPtEXzZiVKpCB3n/26cYJsP18mXmLh4+Tk/x+M9q2/nHh2qPK5WREd2qR12Mov
 +FJjTJ+CpN/pXtomNlmzgIVJmiRn+rI0u+dBS5e8=
Date: Tue, 8 Sep 2020 15:33:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 1/7] soundwire: bus: use property to set interrupt masks
Message-ID: <20200908143312.GC5551@sirena.org.uk>
References: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
 <20200818140656.29014-2-yung-chuan.liao@linux.intel.com>
 <20200828065125.GI2639@vkoul-mobl>
 <ec5fe867-f2e4-4278-0376-e54bcdd7f94d@perex.cz>
 <20200908121133.GA5551@sirena.org.uk>
 <1950b662-ec59-6603-36c7-7a41d9e8460c@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline
In-Reply-To: <1950b662-ec59-6603-36c7-7a41d9e8460c@perex.cz>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 hui.wang@canonical.com, Vinod Koul <vkoul@kernel.org>,
 srinivas.kandagatla@linaro.org, ranjani.sridharan@linux.intel.com,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2020 at 02:28:48PM +0200, Jaroslav Kysela wrote:
> Dne 08. 09. 20 v 14:11 Mark Brown napsal(a):

> > I don't have this patch and since I seem to get copied on quite a lot of
> > soundwire only serieses I just delete them unread mostly.

> It can be fetched from lore (mbox format):

> https://lore.kernel.org/alsa-devel/20200818140656.29014-2-yung-chuan.liao@linux.intel.com/raw

Sure, I can go get stuff from the list archives but my list of things to
go through is in my inbox.

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9XligACgkQJNaLcl1U
h9Bv+gf8DTCBNgYdd/v4aDuaMyXv6CqPVU+U14UjTNqUUDstwuDd15nP/+11+Ovp
cYACg3bu24coO3wH/h4PhoI19PadHctIBRSGojJL6CYzT20jPzzvRWjR6A+fTecU
T6jIGEQMjGypi1MbM2J6f4dty76zSKysy2fW8dlG8+8HqLXQQ8Oh0XKEPUysvL8t
CK5SLnsVK8AHcxLZT6wFcJ0qzBRFoA4FDvEhke0xEiYvXJ96wGc5vCClew+oRCIA
LDw4jwqaQmFEggYz+/7JLqPetUU5D+xE2L3ulkiUzTd+cg9+5k1LqMd6528LlwxJ
aNZtrusstwa3q9udD2R0zKMgM/4NRA==
=ODCF
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
