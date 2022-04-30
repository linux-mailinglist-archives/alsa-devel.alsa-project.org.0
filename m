Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A53515DB7
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Apr 2022 15:39:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 382931F4;
	Sat, 30 Apr 2022 15:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 382931F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651325974;
	bh=FzJFz5nQnOEB7AB6Bbc1j8nS92uMjFglrLsFGFrMKzw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HlkROBDVJjg6FtS1vSQDFLeXJRY96YOOeV4PGL2RaoSzHPIJZ3bISXdVx00OAsu/k
	 01RK26MpEP2sceDp0NT0NuxYIjesW7raNuTUw3kCLtmitudeX8i5S9mcmrYHobiLGF
	 BP0Jf3wtmRp5VZXv3qFKLsS+DZEFckflbpn6Fylg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91F99F80125;
	Sat, 30 Apr 2022 15:38:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86732F8012A; Sat, 30 Apr 2022 15:38:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AFB3F80121
 for <alsa-devel@alsa-project.org>; Sat, 30 Apr 2022 15:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AFB3F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jlSMgCul"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9088260B43;
 Sat, 30 Apr 2022 13:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA220C385AA;
 Sat, 30 Apr 2022 13:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651325904;
 bh=FzJFz5nQnOEB7AB6Bbc1j8nS92uMjFglrLsFGFrMKzw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jlSMgCulySK0sR8W6lTjvw+WKsHy9h2dvPSn/5YMc2Ov1/C/vSQeLPrh3/hxq3C2S
 3IgkIw0WSNTct9hBvrXmgMyELaYee9X3mtIvkZ2yTAPC2v3ej3vzF8gFH8UU44MXbw
 KAqWgwhvW5Kb+28/T9aQZOdeMKDQxhCoyaDM5Rc4HmIJ7hWl19h6P1Gfv/gEy6VuWa
 AFwi7dJptexzaE2VQYSiaVEgvKpTyAV4wyKOTlFHh6sphvpGPBihxxB6k6TaJew2RL
 kkHhZDiMzx49PBfmL29bVUZATY3SHGlyUfdYempi/ByrrXPMeyQ9uc+WWBkNDMAlQp
 uxkJBLqr/FN2w==
Date: Sat, 30 Apr 2022 14:38:14 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] module: update dependencies at try_module_get()
Message-ID: <20220430143814.7184bd93@sal.lan>
In-Reply-To: <Ym0l6yeTWCCAeww8@kroah.com>
References: <cover.1651314499.git.mchehab@kernel.org>
 <3c7547d551558c9da02038dda45992f91b1f5141.1651314499.git.mchehab@kernel.org>
 <Ym0l6yeTWCCAeww8@kroah.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, mauro.chehab@linux.intel.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Kai Vehmanen <kai.vehmanen@intel.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Dan Williams <dan.j.williams@intel.com>,
 linux-modules@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

Em Sat, 30 Apr 2022 14:04:59 +0200
Greg KH <gregkh@linuxfoundation.org> escreveu:

> On Sat, Apr 30, 2022 at 11:30:58AM +0100, Mauro Carvalho Chehab wrote:

> Did you run checkpatch on this?  Please do :)
> 
> > +
> > +	if (mod == this)
> > +		return 0;  
> 
> How can this happen?
> When people mistakenly call try_module_get(THIS_MODULE)?  

Yes. There are lots of place where this is happening:

	$ git grep try_module_get\(THIS_MODULE|wc -l
	82

> We should
> throw up a big warning when that happens anyway as that's always wrong.
> 
> But that's a different issue from this change, sorry for the noise.

It sounds very weird to use try_module_get(THIS_MODULE).

We could add a WARN_ON() there - or something similar - but I would do it 
on a separate patch.

> 
> > +
> > +	mutex_lock(&module_mutex);
> > +
> > +	ret = ref_module(this, mod);
> > +
> > +#ifdef CONFIG_MODULE_UNLOAD
> > +	if (ret)
> > +		goto ret;
> > +
> > +	ret = sysfs_create_link(mod->holders_dir,
> > +				&this->mkobj.kobj, this->name);  
> 
> Meta comment, why do we only create links if we can unload things?

Good question. I don't know for certain. This is the already existing 
pattern at add_usage_links() - see kernel/module/sysfs.c.

Also, lsmod uses sysfs links when showing dependencies.

Regards,
Mauro

