Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D6A203722
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 14:46:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC63416AF;
	Mon, 22 Jun 2020 14:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC63416AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592830011;
	bh=agUak84EByTr6VsST2IfweEac8jCj0gpjJE8cznvHpI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eI/tR9QcUPETc3AE7pFjGzAV7Mc9Dwk3i7jgzDa1/+lVxGWoyPfIEdSK/Jjh8E329
	 CVzZw8gNp0F7vKpGx4XolxP3D1Dj7NFN7RKC4nZyEu2mzI7EoXUfyz+QZ/WhZogcFe
	 wHD8gWZHvxGem+DucEXNm9gt44lnNheM6UjRmUDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12837F80157;
	Mon, 22 Jun 2020 14:45:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4447F8015B; Mon, 22 Jun 2020 14:44:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C77CF8010D
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 14:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C77CF8010D
IronPort-SDR: X5LyAvT34bb1yaVKWLVzWkvafN/uR+sUiwq4KtXSA8PNaw0khzGgsLnK5H3wnkfRAQZSKzKAeE
 rCKidF7B4cew==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="132168034"
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="132168034"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 05:44:50 -0700
IronPort-SDR: 68MqyOqeKLUbs4Smd8Wx/9QT9f30sCpnM5edZ/GiWcX4T8P6Ts4+PPXl/YAnEuqBHi3miyveoy
 aKRDTQ0W7CEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="278740703"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006.jf.intel.com with ESMTP; 22 Jun 2020 05:44:48 -0700
Date: Mon, 22 Jun 2020 15:44:33 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 02/16] ASoC: soc-component: use io_mutex correctly
In-Reply-To: <87r1uf4mfa.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <alpine.DEB.2.22.394.2006221537050.3186@eliteleevi.tm.intel.com>
References: <87tuzb4mjg.wl-kuninori.morimoto.gx@renesas.com>
 <87r1uf4mfa.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On Tue, 16 Jun 2020, Kuninori Morimoto wrote:

> component has io_mutex, but it had been used at
> snd_soc_component_update_bits_legacy() only which does read and write.

this is quite interesting. I wonder as regmap does its own locking, should
io_mutex only be used on the non-regmap paths? The patch looks correct 
though, holding the mutex only in update_bits won't help when write is 
without locks.

Br, Kai
