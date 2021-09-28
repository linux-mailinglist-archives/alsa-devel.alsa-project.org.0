Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BADDC41AD53
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 12:53:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FA7116A4;
	Tue, 28 Sep 2021 12:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FA7116A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632826398;
	bh=HZbgNmG5mS9B2rHGCpqdYry7NQXuvOs1oIKgA0SbbUU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PBXQhLjL2zE8FLVK6qLRVIi5KqqDWaUQw9F3htEHSy38ufLZmb4ggzGL044/4xH22
	 /AIlZL8vnTIrKEaQeXbc52VryNmxKwNsBHF7ai+Y9mOlBYiU8IuLN38LV7oKXSuf61
	 T3VllQcsGdHDpYARFheY8YAQd8pqNmNWB0pdLFCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEBC8F800DE;
	Tue, 28 Sep 2021 12:52:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 504DEF804AD; Tue, 28 Sep 2021 12:52:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F11EEF80105
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 12:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F11EEF80105
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="204160515"
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="204160515"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 03:51:46 -0700
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="553942040"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 03:51:44 -0700
Date: Tue, 28 Sep 2021 13:45:01 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] component: do not leave master devres group open
 after bind
In-Reply-To: <s5hh7e5ngnq.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2109281335522.3554566@eliteleevi.tm.intel.com>
References: <20210922085432.2776886-1-kai.vehmanen@linux.intel.com>
 <s5hh7e5ngnq.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-ID: <alpine.DEB.2.22.394.2109281342020.3554566@eliteleevi.tm.intel.com>
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, jani.nikula@intel.com,
 gregkh@linuxfoundation.org, Imre Deak <imre.deak@intel.com>,
 dri-devel@lists.freedesktop.org, Russell King <rmk+kernel@armlinux.org.uk>,
 Russell King <rmk+kernel@arm.linux.org.uk>, intel-gfx@lists.freedesktop.org
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

Hey,

On Tue, 28 Sep 2021, Takashi Iwai wrote:

> On Wed, 22 Sep 2021 10:54:32 +0200, Kai Vehmanen wrote:
> > --- a/drivers/base/component.c
> > +++ b/drivers/base/component.c
> > @@ -246,7 +246,7 @@ static int try_to_bring_up_master(struct master *master,
> >  		return 0;
> >  	}
> >  
> > -	if (!devres_open_group(master->parent, NULL, GFP_KERNEL))
> > +	if (!devres_open_group(master->parent, master, GFP_KERNEL))
> >  		return -ENOMEM;
> >  
> >  	/* Found all components */
> > @@ -258,6 +258,7 @@ static int try_to_bring_up_master(struct master *master,
> >  		return ret;
> >  	}
> >  
> > +	devres_close_group(master->parent, NULL);
> 
> Just wondering whether we should pass master here instead of NULL,
> too?

I wondered about this as well. Functionally it should be equivalent as 
passing NULL will apply the operation to the latest added group. I noted 
the practise of passing NULL has been followed in the existing code when 
referring to groups created within the same function. E.g.

»       if (!devres_open_group(component->dev, component, GFP_KERNEL)) {
[...]
»       ret = component->ops->bind(component->dev, master->parent, data);
»       if (!ret) {
»       »       component->bound = true;

»       »       /*                                                                                                                                                          
»       »        * Close the component device's group so that resources                                                                                                     
»       »        * allocated in the binding are encapsulated for removal                                                                                                    
»       »        * at unbind.  Remove the group on the DRM device as we                                                                                                     
»       »        * can clean those resources up independently.                                                                                                              
»       »        */
»       »       devres_close_group(component->dev, NULL);

... so I followed this existing practise. I can change and send a V3 if 
the explicit parameter is preferred.

Br, Kai
