Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83197310D70
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 16:54:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 264A01678;
	Fri,  5 Feb 2021 16:53:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 264A01678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612540470;
	bh=dMxg4SpeyUAbGttBoN/Y3x3XWggjqiiCsSk56d6lMNU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ksUWRu6HdDC8DoV9kXNi1hv+zebNZ8KQGOBqI3trZ/EatLjTnQhuaJ5UMZJuEZGwS
	 5tzkO4tuk+eGwUwVjCu1vRe6TSeqka7TdTPQd9J8/7EL3H38SiphJ4wch+d4nZkKbH
	 dz56VD5TOL1AjPKXhO1qzLmv+fQbyXRz6EFbLYQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79412F80156;
	Fri,  5 Feb 2021 16:52:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C8A3F8015A; Fri,  5 Feb 2021 16:52:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A35FDF80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 16:52:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A35FDF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q7jSjsau"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3801E650D1;
 Fri,  5 Feb 2021 15:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612540367;
 bh=dMxg4SpeyUAbGttBoN/Y3x3XWggjqiiCsSk56d6lMNU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q7jSjsauzTq8kHhDdgZvBu9iH2Qs5hHkYQ2DloSNTZekbfxmat1wBRtf9fnorVp7X
 PA8XmyxBppO6pvuvdqTGOKmdJKrU31cgxTMNdDhxc61rhJbd8H8XxP567jBzkMhuLH
 IBeGI48Yslc/oWv0cvbu+r+UA7U4qVZQi27NZNF/UKwmEAuQ+lxnYdczYjVbNC8N6r
 +ptypuNw41h2fE0IXQeCoNN54U0DGwRdO8Kn0dpYdh7m/SeGZUDv92Hdveo4rojXPx
 IrBkbCV00gw1oAbcocSFxYkXic55D0dbKIG5HP3/oM5H9ecfwhuyqg21XqzM9StT4s
 bWj6eyJ/5Hy+w==
Date: Fri, 5 Feb 2021 15:51:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 14/14] ASoC: SOF: Intel: hda: add dev_dbg() when DMIC
 number is overridden
Message-ID: <20210205155157.GF4720@sirena.org.uk>
References: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
 <20210204203312.27112-15-pierre-louis.bossart@linux.intel.com>
 <20210205153336.GE4720@sirena.org.uk>
 <d6f10083-f046-a708-60b1-86e3fd731e60@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
Content-Disposition: inline
In-Reply-To: <d6f10083-f046-a708-60b1-86e3fd731e60@linux.intel.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 vkoul@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2021 at 09:47:39AM -0600, Pierre-Louis Bossart wrote:
> On 2/5/21 9:33 AM, Mark Brown wrote:
> > On Thu, Feb 04, 2021 at 02:33:12PM -0600, Pierre-Louis Bossart wrote:

> > This is breaking in an x86 allmodconfig build due to:

> > which will actually be triggered by one of the earlier patches in the
> > series (my script is going through things in reverse order), that
> > variable is only defined for CONFIG_SOC_SOF_HDA.

> That's not good. Please drop this patch for now, it's nice-to-have and not
> critical.

> I'll have to figure out why this wasn't reported earlier.

Like I say it's not that patch that's causing the break, I didn't walk
through and work out which one was - the patch isn't actually adding the
usage or anything.

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAdaZwACgkQJNaLcl1U
h9BkuAf+JJKK5CRaw7Y1FJjqNuJLxWrn0O8gKdRpvmws1IMzMxz/8sLaBVfGyRb3
vKVcIDfwS5MjUSxO78tLR+VgpgLXWaJg+wKosGXdjB7vEaCkHVMQmcQE+aFyUmp/
s5P3yKdqlSelR7/+7eeqOulfyyn/D04fVHXtWufdDratsGQ680m83SSpMjlrkpBl
bDaMN0CFzzhThW85F8Z6IGnXQufcOH9YBgESrbF+3ouFE0rc87MR/KvttfL8okGy
ODRUppIRvUaPAo9/lx0/MmeiSpG60Xg1mI9gj0opAqjB0udXzN9tyL1Wj77MvlJ9
JgBPCKW0ix493rDtlyUSphbFHJ8qFg==
=eiGK
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--
