Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EE9271DF1
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:29:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 716A316E2;
	Mon, 21 Sep 2020 10:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 716A316E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600676969;
	bh=aA6DpVOhVmKq1EyX/ZaXo/RiJr343ksIPQPXm+UiN2g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U10gqWzRMQHNVH5TNwr0IGXKJDjO1iPduevD4IrIUccEITO6nQb+r/m6vyfoCcV7f
	 aq+y4LgmaKKfnc7F8gX8+DoGp5fJPeh0K5xlzdr5TLqJZUbyHGL68bOFkFUziSx51l
	 mx+TO9ele2Y3ulWd9M7MuqoGq3y/pKx4+kkSN2h0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11E36F801EC;
	Mon, 21 Sep 2020 10:22:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6C20F801EC; Mon, 21 Sep 2020 10:22:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCE3BF8015F
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 10:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCE3BF8015F
IronPort-SDR: DUEkrvPYvT3ZVbcZPlftXXZ36/IxiwLehygmcyQip26OWmm7TQNWHGV2mob9HljJf8lDrW2Ig8
 HHMFHy45n6Ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="148084680"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="148084680"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 01:22:30 -0700
IronPort-SDR: 6C60UxQb0GHDdFKyIHdyi1KCMTv7lBRai9I8E9wx7SVauw0irJ+svuoaM5rOqv55nvU7IplbI2
 gRPnca98YzBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="337792604"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 21 Sep 2020 01:22:26 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kKGsv-000gbr-5e; Mon, 21 Sep 2020 11:09:17 +0300
Date: Mon, 21 Sep 2020 11:09:17 +0300
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH v6 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Message-ID: <20200921080917.GL3956970@smile.fi.intel.com>
References: <20200917141242.9081-1-cezary.rojewski@intel.com>
 <20200917141242.9081-10-cezary.rojewski@intel.com>
 <8edff9bc51ea441dac454cbb6869317f@intel.com>
 <20200919144204.GD2712238@kroah.com>
 <dfdb29d1c5f04d88970757e1ec9596d9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfdb29d1c5f04d88970757e1ec9596d9@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>, "Papierkowski,
 Piotr \(Habana\)" <ppapierkowski@habana.ai>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

On Sun, Sep 20, 2020 at 05:03:00PM +0000, Rojewski, Cezary wrote:
> On 2020-09-19 4:42 PM, gregkh@linuxfoundation.org wrote:
> > On Fri, Sep 18, 2020 at 03:22:13PM +0000, Rojewski, Cezary wrote:
> >> On 2020-09-17 4:12 PM, Cezary Rojewski wrote:
> >>> Add sysfs entries for displaying version of FW currently in use as well
> >>> as binary dump of entire version info, including build and log providers
> >>> hashes.

...

> >> Greg, would you mind taking a look at these sysfs entries added for new
> >> catpt driver (Audio DSP driver for Haswell and Broadwell machines)?
> > 
> > Why me?
> > 
> 
> Andy (CC'ed) suggested that it's best if sysfs code is routed through you.
> Given your input, I believe he was right.

'routed' probably is not what I meant, rather 'reviewed'. Because I remember
that sysfs got new support for attributes thru certain members of the driver
structure. Also I'm not sure I know the policy about binary attributes (it's
possible that my knowledge is interfering with sysctl binary attributes that
are no-no nowadays).

Anyway, thanks for looking into this!

> >> Link to opening post for the series:
> >> [PATCH v6 00/14] ASoC: Intel: Catpt - Lynx and Wildcat point
> >> https://www.spinics.net/lists/alsa-devel/msg115765.html
> > 
> > Does lore.kernel.org handle alsa-devel yet?
> > 
> 
> Believe it does as alsa-devel archive can be found on lore.kernel.org.
> Not really the guy to answer integration questions, though.

...

> >>> +	ret = catpt_sysfs_create(cdev);
> >>> +	if (ret)
> >>> +		goto board_err;
> > 
> > Why are you calling a specific function to do all of this?  Why not
> > provide a default_groups pointer which allows the driver core to
> > automatically create/destroy the sysfs files for you in a race-free
> > manner with userspace?
> > 
> > That's the recommended way, you should never have to manually create
> > files.
> 
> Thanks, that's something new. As this is simple device-driver, I believe
> you meant usage of sysfs_(add|remove)_group() or their "device"
> equivalents: device_(add|remove)_group(), is that correct? Haven't found
> any usage of default_group within /sound/ subsystem what cannot be said
> about the functions I've just mentioned.
> 
> Feel free to correct me if I'm wrong about this.

It's a member of the struct device_driver, if I'm not mistaken.

-- 
With Best Regards,
Andy Shevchenko


