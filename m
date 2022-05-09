Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C91B452030B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 18:57:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DC8518DC;
	Mon,  9 May 2022 18:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DC8518DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652115458;
	bh=NT/NSm+ixv4NTnm+bzYUbh8NWftsy0GkupiwFftUrCw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IU9vnJVUR1SQCyIbhL0I8FSd0XJXIGd3iIX/s6Ttplhh3D8g0lfDg47bfNHTk+PHN
	 UTMEE1KGVjaOeZZzoVjPPqIMQpaU5uRUviW5VeijFVcaENftR9ezE1RbN1aiI+INYn
	 ZP2T3rSBjaOZrlDq7LkZlNAu139Tvr0IoKcp7Ny8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDD22F80269;
	Mon,  9 May 2022 18:56:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65B78F8025D; Mon,  9 May 2022 18:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19D65F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 18:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19D65F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EtvoF8Ip"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62A69B8180F;
 Mon,  9 May 2022 16:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCA4C385B1;
 Mon,  9 May 2022 16:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652115387;
 bh=NT/NSm+ixv4NTnm+bzYUbh8NWftsy0GkupiwFftUrCw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EtvoF8IpfrUKSdvwW8V1qeHxhWfkW598IrjNsAqteSHaADCcEdw4x8KXDr3TbpGco
 +yggH/xodb4xZyPEnEeIc8mWLqDjS4iXNJXSCuBQpOQ/fSanq8ns6RptBh90cQlffa
 ZydWP2ygHERY2FiBF7EYP2PUX0oJed77PI+PtGtAug8JPiOmVIAJvSdJSVF0l2WgT3
 wW5f+Mu+92KTr/DOaR7Nqi5mZ7fd/NZ7bLFFprVwVSRAaFOoxIjPeDgJTM5EOXSyV1
 crJcVua2rcdRuwnbPejGtAvrTv7VAS/uq+3pJDH8Q5DUtKss9HWmbgKe7fxadeJAws
 EJ34J+Ehy52jg==
Date: Mon, 9 May 2022 18:56:20 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 1/2] module: update dependencies at
 try_module_get()
Message-ID: <20220509185620.05567716@coco.lan>
In-Reply-To: <YnRDIfthGJXdY23h@intel.intel>
References: <cover.1651348913.git.mchehab@kernel.org>
 <ad2a9fe66cf502e2e2e2325f1f04d0fae36aa82b.1651348913.git.mchehab@kernel.org>
 <YnRDIfthGJXdY23h@intel.intel>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: mauro.chehab@linux.intel.com, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Kai Vehmanen <kai.vehmanen@intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
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

Em Thu, 5 May 2022 23:35:29 +0200
Andi Shyti <andi.shyti@linux.intel.com> escreveu:

> Hi Mauro,
> 
> [...]
> 
> > +static int ref_module_dependency(struct module *mod, struct module *this)
> > +{
> > +	int ret;
> > +
> > +	if (!this || !this->name)
> > +		return -EINVAL;
> > +
> > +	if (mod == this)
> > +		return 0;
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
> > +#endif
> > +
> > +ret:
> > +	mutex_unlock(&module_mutex);
> > +	return ret;
> > +}
> > +
> >  /* Clear the unload stuff of the module. */
> >  static void module_unload_free(struct module *mod)
> >  {
> > @@ -841,24 +886,16 @@ void __module_get(struct module *module)
> >  }
> >  EXPORT_SYMBOL(__module_get);
> >  
> > -bool try_module_get(struct module *module)
> > +bool try_module_get_owner(struct module *module, struct module *this)
> >  {
> > -	bool ret = true;
> > +	int ret = __try_module_get(module);
> >  
> > -	if (module) {
> > -		preempt_disable();
> > -		/* Note: here, we can fail to get a reference */
> > -		if (likely(module_is_live(module) &&
> > -			   atomic_inc_not_zero(&module->refcnt) != 0))
> > -			trace_module_get(module, _RET_IP_);
> > -		else
> > -			ret = false;
> > +	if (ret)
> > +		ref_module_dependency(module, this);  
> 
> do we care about the return value here?

I don't think it should care about the return value, as a failure to
create a sysfs node for the holder or to add it to the holders list
is not fatal: modules can still continue working without that.

Also, I opted to be conservative here: currently, not creating these
doesn't cause try_module_get() to fail. I'm not sure what would be the
impact if this starts to fail.

So, right now, I'm opting to just ignore the return value. Perhaps
in the future this could a warning (similarly to what sysfs create
link does).

Regards,
Mauro

> 
> Andi
> 
> >  
> > -		preempt_enable();
> > -	}
> >  	return ret;
> >  }
> > -EXPORT_SYMBOL(try_module_get);
> > +EXPORT_SYMBOL(try_module_get_owner);
> >  
> >  void module_put(struct module *module)
> >  {
> > -- 
> > 2.35.1  



Thanks,
Mauro
