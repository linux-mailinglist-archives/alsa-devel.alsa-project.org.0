Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 872621FD85C
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 00:06:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C0D9166D;
	Thu, 18 Jun 2020 00:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C0D9166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592431612;
	bh=QORfCT/Xyhe7gLua5bW25Wkpcctw8H30A6GURI1tECg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YozuipHlteCZnYr8S+qNxfOyWVGr4oar33L02xzSICrWsvyB0j3dVuOYPSS4TqsDl
	 R8YRQWfD9XcVBUiiKly9bEpMYwprdWkX8CrGvU4XLrzvfyePDMjg7MVB7e+3/cIHGx
	 tK4GOlzLzXQjQnQ5B8+ShA+xFHuEsf8NPXhfs8WE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E17FF801D9;
	Thu, 18 Jun 2020 00:05:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D4F1F80171; Thu, 18 Jun 2020 00:05:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_76,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52B35F80116
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 00:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52B35F80116
Received: by mail-il1-f195.google.com with SMTP id h3so3829775ilh.13
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 15:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+CsQR2qsSoI73GnHFqoZfpGxUfo0rIGsGeEXk1ewMAk=;
 b=jbSi/f40KAW/Mt8uzttgRSM7OrZbHAdOerduePc1EddOm+gdWQoFzOXEVPj/HwhS+q
 9zh382okOwt7k1EKw1ru28/H58kymCcGxyWtrt19+GvhkE7dAi33R2sL7b4+w68YNyO8
 2wa2clYznPCA1QEhsDPytZaTOeccRp+pb6s5PQ6URjA0xmwGLMM98tPl7WH7SqRsXRZZ
 2ly9QdHtE771c44NdUnWnkTsQdPR0eVmLqsUfSw30K+2BVk4eo+Byi7QtgWs42HP0InU
 lghbip0tnrq0lnwEXUOEbsb4qKuaurfM2vnkkwwrqo2VW/xua+aVqJ3duvV+HuNjmkJh
 vEsQ==
X-Gm-Message-State: AOAM530tYxRNY+7FtdDPDqr8AH8r6QtLJkPCw9IWHK686G8vCmUqbqEw
 +EYQ+ayOhW3d2eOQ3gnosQ==
X-Google-Smtp-Source: ABdhPJxbchfeSCY4yu6rb64R7RrR97GYimVKByBST0ppb7bKIzKmF0oKQBqmLJvNwoHC3I6aOCZiWg==
X-Received: by 2002:a92:899b:: with SMTP id w27mr1147898ilk.16.1592431501074; 
 Wed, 17 Jun 2020 15:05:01 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id n1sm470890ilm.55.2020.06.17.15.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:05:00 -0700 (PDT)
Received: (nullmailer pid 2912668 invoked by uid 1000);
 Wed, 17 Jun 2020 22:04:59 -0000
Date: Wed, 17 Jun 2020 16:04:59 -0600
From: Rob Herring <robh@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: tas2562: Add firmware support for
 tas2563
Message-ID: <20200617220459.GA2884884@bogus>
References: <20200609172841.22541-1-dmurphy@ti.com>
 <20200609172841.22541-2-dmurphy@ti.com>
 <20200609173143.GN4583@sirena.org.uk>
 <bb7cff87-f814-1b37-c9eb-e68919e3c077@ti.com>
 <20200609175852.GQ4583@sirena.org.uk>
 <414a2d73-6d09-1e76-59c8-4943c0e8f720@ti.com>
 <20200609184734.GS4583@sirena.org.uk>
 <014b85b5-677b-569a-4eb2-74526d3f00bc@ti.com>
 <20200610102920.GC5005@sirena.org.uk>
 <84a6dd5f-cc3e-adb4-ae94-b4fe389adfd9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84a6dd5f-cc3e-adb4-ae94-b4fe389adfd9@ti.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 Mark Brown <broonie@kernel.org>
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

On Wed, Jun 10, 2020 at 09:12:15AM -0500, Dan Murphy wrote:
> Mark
> 
> On 6/10/20 5:29 AM, Mark Brown wrote:
> > On Tue, Jun 09, 2020 at 02:20:29PM -0500, Dan Murphy wrote:
> > > On 6/9/20 1:47 PM, Mark Brown wrote:
> > > > That's really not very idiomatic for how Linux does stuff and seems to
> > > > pretty much guarantee issues with hotplugging controls and ordering -
> > > > you'd need special userspace to start up even if it was just a really
> > > > simple DSP config doing only speaker correction or something.  I'm not
> > > > sure what the advantage would be - what problem is this solving over
> > > > static names?
> > > IMO having a static name is the problem. It is an inflexible design.
> > > Besides the firmware-name property seems to be used in other drivers to
> > > declare firmwares for the boards.
> > > But if no one is complaining or submitting patches within the codecs to be
> > > more flexible with firmware then I can just hard code the name like other
> > > drivers do.
> > I'm not *completely* opposed to having the ability to suggest a name in
> > firmware, the big problem is making use of the DSP completely dependent
> > on having a DT property or doing some non-standard dance in userspace.
> 
> Well from what I see we have 4 options.
> 
> 1.  We can have a DT node like RFC'd (Need Rob's comments here)

We've obviously already allowed 'firmware-name', but the preference is 
still not putting into DT. It's really a Linux userspace interface.

> 2.  We can have a defconfig flag that hard codes the name (This will
> probably be met with some resistance if not some really bad reactions and I
> don't prefer to do it this way)
> 
> 3.  We can hard code the name of the firmware in the c file.
> 
> 4.  Dynamically derive a file name based on the I2C bus-address-device so it
> would be expected to be "2_4c_tas2563.bin".  Just need to figure out how to
> get the bus number.

Given bus numbering may not be constant, that seems like not the best 
way to match up devices. I'd assume that userspace needs some way to 
identify which instance is which already, so maybe there's other data 
you can use already.

> I don't see the user space as a viable option because the codec will have to
> load and then the user space would have to request to load the firmware and
> then more mixer controls will appear.
> 
> Again only option 1 allows us to have different firmware binaries per IC
> instance and also denotes the use of the DSP.  The DSP is not programmed
> until the user space selects the program or configuration from the binary. 
> So special audio handling is very explicit in the user space.  More then
> likely most standard distributions will not even use the DSP for this device
> it is more of a specialized use case for each product.
> 
> 
> 
