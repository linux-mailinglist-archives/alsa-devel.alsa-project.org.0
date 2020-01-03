Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEC412F264
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 01:56:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2014C16B5;
	Fri,  3 Jan 2020 01:55:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2014C16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578012975;
	bh=xvoGAaMQM+baxiJxcMKbJmdVYzOXRC+LCD68MLrycrc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Im9/JYq0+mWBj0DM6/yxun8bvTQEMXpmv6fq1wfqVKuUegwZlqCCIgFOxxCfaOxIO
	 STbn0IHV9d9Keu/VyqISYsynoKCPXnujEVShqQUqcbhVjHjipUCcVOyVB7xaCsI/8q
	 manddYxCiAojvPb8btluYZDAILMg79M8r4jG0kjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C5E1F80157;
	Fri,  3 Jan 2020 01:54:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21AB6F80157; Fri,  3 Jan 2020 01:54:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 812F1F8011F
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 01:54:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 812F1F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="aizdm9sr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w8FcuKIRc1fu8oxZLGHNujTkaW4KdWzXN9N/pQxssUs=; b=aizdm9srKEF+86calgWhejVZI
 lvrluuEvxzSfCattQ54W4Sloxfh/oqSeHcZDzsEvJLGGfvdTWf4j5sPBFu9KdD6IdIUp6kfAtw0D8
 TJBRLFaoVF0GVnS5DuyuOJ61E6LxztQK6IJwIKgBTiuGw6F7vhUgr+GJiSl7ElShB8MVE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1inBEP-0003Ll-DL; Fri, 03 Jan 2020 00:54:25 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 2AF04D057C6; Fri,  3 Jan 2020 00:54:24 +0000 (GMT)
Date: Fri, 3 Jan 2020 00:54:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20200103005424.GF3897@sirena.org.uk>
References: <20191229150454.2127-1-digetx@gmail.com>
 <20191231001719.GC3897@sirena.org.uk>
 <03ccf221-697e-bc34-f4ba-bf191aecd675@gmail.com>
MIME-Version: 1.0
In-Reply-To: <03ccf221-697e-bc34-f4ba-bf191aecd675@gmail.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Bard Liao <bardliao@realtek.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v1] ASoC: rt5640: Fix NULL dereference on
	module unload
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
Content-Type: multipart/mixed; boundary="===============1552986420500390872=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1552986420500390872==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V4b9U9vrdWczvw78"
Content-Disposition: inline


--V4b9U9vrdWczvw78
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2020 at 06:57:14PM +0300, Dmitry Osipenko wrote:
> 31.12.2019 03:17, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > Please think hard before including complete backtraces in upstream
> > reports, they are very large and contain almost no useful information
> > relative to their size so often obscure the relevant content in your
> > message. If part of the backtrace is usefully illustrative then it's
> > usually better to pull out the relevant sections.

> Yeah, perhaps it's not really useful to have backtrace in the commit's
> description for the case of this patch in particular. But in general it
> is very useful to have backtraces somewhere near the patch such that
> online search engines, like google, could pick it up. I'll move the
> backtrace below --- in v2, thanks.

Right, this is more directed at just pasting in the entire
backtrace (which can be huge with lots of generic bits before the
small number that are relevant) but some edited highlights can
definitely be helpful for search engines and for explaining the
problem.  I'll modify what I'm saying there to clarify this.

--V4b9U9vrdWczvw78
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4OkLwACgkQJNaLcl1U
h9BL0gf/bBWZbW0DvZqYZ84Y2N8XEhFRF5QQ+NS5MBAvcrqzNDvh/KAHA0Vzm9Xq
NBM3uErwYTIgr+uRQSMbu6MQ+YeG5nptjZoPv3c0rWN5jT5ZXjmxIfFlE9EFuAn0
tq3Jhi1U8fGT8oopIMLKQPWvF3FGE242LyYR1C1PLprQk9VMxf6iP0OBRfhG/thu
MzDgxHjbqlsDY6eWnAt2ViTL8MG+1TobCEGkifo6j2kLk8ARy0C1ThkdVGDIc970
xvKX7QouOf94TT3C+2kfdV6TyCEG7BtYfjkirDuMRgOddz0QhAuXC3yi4f7lympq
k7w6IV//x/B7qbVREWl06hP7/HpKBg==
=1GRG
-----END PGP SIGNATURE-----

--V4b9U9vrdWczvw78--

--===============1552986420500390872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1552986420500390872==--
