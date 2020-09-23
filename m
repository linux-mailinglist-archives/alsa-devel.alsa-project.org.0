Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9AD275E77
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 19:19:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 436A21744;
	Wed, 23 Sep 2020 19:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 436A21744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600881551;
	bh=pXl4rjwGVd/9QMBbU5gSvpTosiJr0W1zBefEyZObaBw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gf5ZYhJT+3a1+9NoSn718P/+kq+zIGp6alRgc00tn8hh4AADNlPCdXTkbOZ8HkAEk
	 Q5r6bjuivM4ZqGfSiJNzZBjmdty9j2YImX+nV88ZEpWHR6KVU/MDIIlfvy/JIvxSVZ
	 VRlU0e3Moy8LBS59Ov8PjbU97hTx+2YLRxatPnd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EB6FF800B4;
	Wed, 23 Sep 2020 19:17:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 568EDF80171; Wed, 23 Sep 2020 19:17:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D08BEF800B4
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 19:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D08BEF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZC+g5ZOc"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DE5F21BE5;
 Wed, 23 Sep 2020 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600881433;
 bh=pXl4rjwGVd/9QMBbU5gSvpTosiJr0W1zBefEyZObaBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZC+g5ZOcQDl/IZIC9BEzy/fK/mefGhNKQR27oSf7+6o7e/WhSZzndyAJyOJ36jcz5
 vC31TlW6x9GK9OUsp/jtpAdheiCCIzWW327itTqV5WUijKpTypX30GL0ZN+UHPmJ66
 YNhulFiY5crOvzRT5snH1DaE8KBkO0qZM1TSuw5w=
Date: Wed, 23 Sep 2020 19:17:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v8 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Message-ID: <20200923171731.GB3732240@kroah.com>
References: <20200923122508.3360-1-cezary.rojewski@intel.com>
 <20200923122508.3360-10-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923122508.3360-10-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 andriy.shevchenko@linux.intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org,
 krzysztof.hejmowski@intel.com, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

On Wed, Sep 23, 2020 at 02:25:03PM +0200, Cezary Rojewski wrote:
> Add sysfs entries for displaying version of FW currently in use as well
> as dumping full FW information including build and log-providers hashes.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Much nicer:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
