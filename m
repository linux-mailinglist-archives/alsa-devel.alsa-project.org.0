Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEB3636233
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 15:46:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF0571678;
	Wed, 23 Nov 2022 15:45:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF0571678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669214806;
	bh=GP/bMroxjBd4Bf28LbNnOgH2qW191d23DuhYrLswhdY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pWP+zxrrKLlrfVKUXYwav6m4NYh7nL20EphjeE2Yfb2U03ZNTPRIY9gAkigfpPrxQ
	 FJN/n6pska0p+dvECZ0ATUQN5qDK6TYs1UU8chOONNS8x0Z2wpaUX3jJ+mJeqPIIeu
	 7WkkLTQuHI5BAJRqBPI8h5tUaBP+PJrCFWO3vffk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3E35F804D2;
	Wed, 23 Nov 2022 15:45:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB787F8049C; Wed, 23 Nov 2022 15:45:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A5CFF8030F
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 15:45:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A5CFF8030F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JBa1XbMM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC56F61D51;
 Wed, 23 Nov 2022 14:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98ECC433C1;
 Wed, 23 Nov 2022 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669214743;
 bh=GP/bMroxjBd4Bf28LbNnOgH2qW191d23DuhYrLswhdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JBa1XbMM+lIIIXQVi6VicwOnHWiXamVdPpwzQecxCdb98E8HcgzLXQx7f1rYhkU7b
 73txLU8V/QrYeGnVvOAcjbh4gectc9QJNYpLZoyr5W1CeO8Gj3KzLBUR83LfKBAawG
 w6dPZYJnyWkS41yN3IGsReJjRhzxeacm+LsEWE3So/L9NkaqzIpPxCrp4airt/XbEy
 yG0agQEaT2KRBUi8MwOyk8uQ3Ml6EsvpTA/ozdiYCXTqr8CL/WU1bI8bQAfx1aaUWh
 OPTu6TOSDwJqIcbS2gdXxnn+lCmuycz9lvNnn1AjpCpERK71iXxqyTjwmdhTuoi7wv
 i/AegByoaSD/Q==
Date: Wed, 23 Nov 2022 20:15:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 7/8] soundwire: intel_init: remove check on number of links
Message-ID: <Y34yE23O0WFq2uDK@matsya>
References: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
 <20221111042653.45520-8-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111042653.45520-8-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org, bard.liao@intel.com
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

On 11-11-22, 12:26, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The number of links is checked with a chip-dependent helper in the
> caller, remove the check in drivers/soundwire/intel_init.c
> 
> This change makes intel_init.c hardware-agnostic - which is quite
> fitting for a layer that only creates auxiliary devices.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
