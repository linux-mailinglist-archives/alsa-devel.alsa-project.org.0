Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2488F8BCA11
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2024 10:52:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A38982A;
	Mon,  6 May 2024 10:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A38982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714985538;
	bh=N/vRgMjutnmXFlKISsQ1KB1ncvd1p8QS7GLxmgmCcDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CynQTCZYduowAw+JrH2xvRGSSVy4EEnu7h5plNkVN6I35OgBYCdcapbeCvc6p19du
	 rIckjR77qcUE5QGbjUOTE44U4mYqYiNBF8p7cEfJiLz28vktkg1i/WhP3zWC0qqllI
	 9DQk6qbuWwZQFYwzwN5qn4PU9lxLWpTVhT+oWhVw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AA88F805AD; Mon,  6 May 2024 10:51:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E115F805A1;
	Mon,  6 May 2024 10:51:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB736F8049C; Mon,  6 May 2024 10:51:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB79AF80152
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 10:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB79AF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Cz18pGDn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714985482; x=1746521482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=N/vRgMjutnmXFlKISsQ1KB1ncvd1p8QS7GLxmgmCcDE=;
  b=Cz18pGDnpXwzvYapYytQscXQvYAVnoYWsFPIFqWqRhk5t+xG03sCev2C
   Hrq6ZSR1hXNcurXpV7V1VEW1nj5SWhReYnVANZur7hk6kZS3QtgNhDVfP
   UgdRyvLIjxYhsG8mqT0XTEJnMuPdbSPYR1Zn7qkgH8EGiBoQ1XSYqgzkj
   ge4IjwF5YJxL4eQNIpTQPUUNVVtnLqedE0FqRdw4WYhxoojy7fUEkq66l
   SxxZuJB9n1qjVM4SlCCSMM1efCa+HO/Y+XuoPg7E7aQwyifLmABOgpuvD
   jnOeg/vTlwcpYt/OCSdD//YNAH4+ce3nEq6PZg1VWnZV4hVbGFF7n3uza
   w==;
X-CSE-ConnectionGUID: 9i97VRXFRXi6AUmrQPOV1w==
X-CSE-MsgGUID: YRp4tg95TCmPz1nHZguTrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10564241"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000";
   d="scan'208";a="10564241"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 01:51:14 -0700
X-CSE-ConnectionGUID: NmbQeUr7Sw6H2rxavCrpIA==
X-CSE-MsgGUID: 6L1JWmOsTb6MMZXFpLAktA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000";
   d="scan'208";a="28114850"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 01:51:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s3u3u-00000004cCx-1Hyf;
	Mon, 06 May 2024 11:51:06 +0300
Date: Mon, 6 May 2024 11:51:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Xu, Baojun" <baojun.xu@ti.com>
Cc: Takashi Iwai <tiwai@suse.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
	"Lu, Kevin" <kevin-lu@ti.com>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"P O, Vijeth" <v-po@ti.com>,
	"Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"soyer@irl.hu" <soyer@irl.hu>
Subject: Re: [EXTERNAL] Re: [PATCH v4 1/3] ALSA: hda/tas2781: Add tas2781 hda
 driver based on SPI
Message-ID: <ZjiZ-vAnsI1XQubA@smile.fi.intel.com>
References: <20240430072544.1877-1-baojun.xu@ti.com>
 <20240430072544.1877-2-baojun.xu@ti.com>
 <87jzkfm2hp.wl-tiwai@suse.de>
 <ZjD1-NSC3X_7JcQg@smile.fi.intel.com>
 <5832318882b14f5cb171ce2ecde1fc93@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5832318882b14f5cb171ce2ecde1fc93@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: HYF7FRQMJE37QOGEVZHQXUJKYA3S2U5A
X-Message-ID-Hash: HYF7FRQMJE37QOGEVZHQXUJKYA3S2U5A
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYF7FRQMJE37QOGEVZHQXUJKYA3S2U5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 06, 2024 at 07:44:41AM +0000, Xu, Baojun wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: 30 April 2024 21:45
> > On Tue, Apr 30, 2024 at 02: 58: 10PM +0200, Takashi Iwai wrote:
> > On Tue, Apr 30, 2024 at 02:58:10PM +0200, Takashi Iwai wrote:
> > > On Tue, 30 Apr 2024 09:25:42 +0200, Baojun Xu wrote:

...

> > > >  snd-hda-cs-dsp-ctls-objs :=                hda_cs_dsp_ctl.o
> > > >  snd-hda-scodec-component-objs :=   hda_component.o
> > > >  snd-hda-scodec-tas2781-i2c-objs := tas2781_hda_i2c.o
> > > > +snd-hda-scodec-tas2781-spi-y :=    tas2781_hda_spi.o tas2781_spi_fwlib.o
> > >
> > > A nitpicking: better to align with other lines (i.e. with *-objs
> > > instead of *-y).
> > 
> > I object this. The better approach is to have a precursor patch that switches
> > to y over objs (the latter is for user space code / tools).
> 
> I also do not fully understand why set it as "y", as you know, I follow
> CONFIG_SND_HDA_SCODEC_TAS2781_I2C, as it do not set to "y".

While you see no side effects, the 'objs' is reserved for user space, while 'y'
should be used in the kernel code. 

See Documentation/kbuild/makefiles.rst "Composite Host Programs", mind
the word "host" meaning.

-- 
With Best Regards,
Andy Shevchenko


