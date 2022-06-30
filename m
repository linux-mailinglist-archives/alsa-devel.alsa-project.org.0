Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67693562377
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 21:51:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6C4B168C;
	Thu, 30 Jun 2022 21:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6C4B168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656618681;
	bh=mgNoeNK5FwsE3dL2orn06BOynHIf61d+JfoFhu8+8Ls=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X4qyci9UsnnhL+a6nmnEcDDwP2cWe5TNXYNkcEx8RI8ZSGJge0FNS6gx1SXe7zisT
	 oATqqQWPLtR0M6D8tCq5WfiDDzrYGttWhJfwuuxOeIlOARRliNg6lgdVFzePusHong
	 3eO8/NDFXpRlxDUskyU3+/lLfd350ReZAL9xiimk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 541C3F804E5;
	Thu, 30 Jun 2022 21:50:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21BB5F804DA; Thu, 30 Jun 2022 21:50:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA93AF800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 21:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA93AF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SFvjp1OP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656618618; x=1688154618;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mgNoeNK5FwsE3dL2orn06BOynHIf61d+JfoFhu8+8Ls=;
 b=SFvjp1OPrcLrI8wP3j0yJgx+FUDy7JR/Q9VGXh4W+M3oB5CjRwlClqqJ
 W/QmivxWmi4G/wXZMQ5dZYV7NjsxFXsbQ37/DibbpHn1R0sKnZKFxroCC
 JosizqKASonCf0YbEaolLFUGh8pzDOTdnskD/MFFPc5lT/q71/PUYGpT2
 gSTPSlnVA+KMGvZLD5IVYmftX0kogJlxeOcD3o1GpXZlyDBt5o3PrPNg5
 fQU4uzlY06uPv5HmR2IMdb41rI+CG3W7cjdHAcas5PkdrLHtgADRnRrb8
 CwQ7FzYAbT8EaRCwqHNhC02uSESY/bLp3sNC+2IuWH/r5MR9PdBzNUTv/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="283550234"
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="283550234"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 12:50:11 -0700
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="618093333"
Received: from jhilliar-mobl.amr.corp.intel.com (HELO [10.212.10.157])
 ([10.212.10.157])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 12:50:10 -0700
Message-ID: <b080405b-d1af-8a32-a429-b09250489f0c@linux.intel.com>
Date: Thu, 30 Jun 2022 14:50:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v5 2/2] ASoC: cs35l41: Read System Name from ACPI _SUB to
 identify firmware
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220630150135.1799535-1-sbinding@opensource.cirrus.com>
 <20220630150135.1799535-3-sbinding@opensource.cirrus.com>
 <2cc37f6d-72a7-9064-cad2-c6c6d21ede61@linux.intel.com>
 <Yr36wcXf1/bNS0a3@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Yr36wcXf1/bNS0a3@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 patches@opensource.cirrus.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 Len Brown <lenb@kernel.org>
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



On 6/30/22 14:34, Mark Brown wrote:
> On Thu, Jun 30, 2022 at 01:35:05PM -0500, Pierre-Louis Bossart wrote:
> 
>> It's my understanding that the _SUB method is optional, not required. It
>> may be wise to plan for a fallback, e.g to use DMI quirks or other
>> identifiers, no?
> 
> Presumably the fallback would go into cs35l41_acpi_get_name()?

That's what I had in mind, if this _SUB does not exist then you could
use something else instead of returning -ENODATA;

+	sub = acpi_get_subsystem_id(handle);
+	if (IS_ERR(sub))
+		return PTR_ERR(sub);
+
+	cs35l41->dsp.system_name = sub;
