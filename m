Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C127F41DD13
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:14:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FC5F16EA;
	Thu, 30 Sep 2021 17:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FC5F16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633014843;
	bh=E49/YDydmu7YC8tHzY4jcu3na/sy3MEa7bzQ0eHan1o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TMlsOXuwbOmUTGYNov3nERK+LKTylPmVPwOQU69LLxDDiW99N3RX+FnBeY0UM0SxB
	 0uxeKc1b6HgAcpRmgV3LvCgyjubYy4qmEzvwUqWMAOujFjmYjFVekSNGU21JSHom31
	 /nQGymwOzmFFRacWvu312s+aj9/2D2bOH/zBK1Kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D8B2F804FB;
	Thu, 30 Sep 2021 17:11:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33910F80227; Thu, 30 Sep 2021 03:46:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mrbrklyn.com (www2.mrbrklyn.com [96.57.23.82])
 by alsa1.perex.cz (Postfix) with ESMTP id ACCA9F80161
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 03:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACCA9F80161
Received: by mrbrklyn.com (Postfix, from userid 1000)
 id 23F86163FB8; Wed, 29 Sep 2021 21:46:00 -0400 (EDT)
Date: Wed, 29 Sep 2021 21:46:00 -0400
From: Ruben Safir <ruben@mrbrklyn.com>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: Re: ALSA kernel projects - for academic purposes
Message-ID: <20210930014559.GA23321@www2.mrbrklyn.com>
References: <CAHhAz+i=3NDuxK2rZZY6N18=OTbkna3VMVpx4nNgF0vyq3JmQA@mail.gmail.com>
 <324112.1632501120@turing-police>
 <CAHhAz+jNCd=cw-bohcoiAA2UhNZYSFLX07qEV-T2p+KAsVHhAQ@mail.gmail.com>
 <YU5QgPwYDB2XnaVP@geday> <20210929150715.GC15841@www2.mrbrklyn.com>
 <YVSzqfgqWEoju4Xw@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVSzqfgqWEoju4Xw@geday>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Thu, 30 Sep 2021 17:11:01 +0200
Cc: Muni Sekhar <munisekharrms@gmail.com>,
 alsa-devel <alsa-devel@alsa-project.org>, Ruben Safir <ruben@mrbrklyn.com>,
 kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-sound@vger.kernel.org,
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
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

> I don't see your point here. 


I know that.  So read what I wrote again and think about the original
poster sitting in a CLASSROOM and working on a thesis due in 2 months


Just try to place yourslef in another persons shoes for 15 minutes.


This guy gets assigned this task and is trying to figure out an
approach.  He is not trying to satisfy YOUR needs,  but the requirments
of is grade so he can graduate.


