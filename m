Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC7F193E88
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 13:03:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB2AA1668;
	Thu, 26 Mar 2020 13:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB2AA1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585224237;
	bh=YwhojiE+uundvJUSWPcr8bIVMk+P/aEqpj9fYCKGt8o=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCe2IoDcpjNsTDzHQLLp81eLaGXHsqShZfeSpA/2T/Dt8tPThho8aVPbXblo9GI/K
	 RTAf6itlr5+hAOYVCK+P3alobXxZuT3AfeaZBqWzg5OrQDtJjCaJIVUb6zWKQLNfLx
	 md3hLRJ/VP4hyD98DRrzgBd1ri/e1kVhn5AvaVak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4BAFF8011B;
	Thu, 26 Mar 2020 13:02:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 376E1F80227; Thu, 26 Mar 2020 13:02:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F99BF8011B
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 13:02:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F99BF8011B
IronPort-SDR: i/FVoEibL+BviVsDRjHegx5TGscGIKflt6V2qBGkzFRn7Qd3m18JrwBaASD+eF7UVj4aZOzycU
 c0JVZmqzbaPA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 05:02:06 -0700
IronPort-SDR: HK5k9D7q2tIXAbwMzNgQ44vb6/y0RErOkKGeGeXiN+3IjHKWZl3zS+8cOFK5acb5TAMLiq+Mai
 3jVauIP1dK9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,308,1580803200"; d="scan'208";a="420676971"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 26 Mar 2020 05:02:06 -0700
Date: Thu, 26 Mar 2020 14:02:05 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: sylvain.bertrand@gmail.com
Subject: Re: sw_params for a direct-ed(dmix) hw pcm
In-Reply-To: <20200325174419.GA1224@freedom>
Message-ID: <alpine.DEB.2.21.2003261350380.2957@eliteleevi.tm.intel.com>
References: <20200321155303.GB357@freedom> <20200325174419.GA1224@freedom>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org
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

On Wed, 25 Mar 2020, sylvain.bertrand@gmail.com wrote:

> On this issue, I am doing something fundamentaly wrong, but I don't see how to
> do it right.
> 
> While configuring a pcm, I should not use sw_params if it is a "direct-ed"
> (direct::dmix) real hw pcm: in pcm_direct.c, snd_pcm_direct_sw_params
> function is empty and it seems coherent with the fact the real hw pcm is
> actually shared and was probably already configured.

how does the problem appear in your program? 

Applications should just use the ALSA PCM API and not have any special 
casing for different types of PCMs (unless the differences show up via the 
public PCM API). If applications started doing plugin specifics, writing 
and deploying new ALSA plugins would become much harder and kind of defeat 
the whole purpose of the plugin API. In case of dmix, the 
pcm.c:snd_pcm_sw_params() should do the right thing and your application 
should get the cached values.

Br, Kai
