Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7154D5BDBF4
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 07:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14E81868;
	Tue, 20 Sep 2022 07:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14E81868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663650124;
	bh=JcZOwfCNW3dBfAsXNvo/jTqcE40QGR1s+zdpQNoCiQI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FG/a2qYBk9hYX7yv62B+37aqUF9/OhmFEE4yPlsAXft8v1yqVQcfM5dwBlYpMjxns
	 FuTCdZZgydJizMnaWTgZKr4xqRxpIMlciT3eSsH7+9HSPE/NEyFhbEPegBzhFOmEcA
	 847TvLumAbXdXHGZ5mxCdnO+oa8D5NHnkgg2mV0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E725F800F2;
	Tue, 20 Sep 2022 07:01:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 244E5F80155; Tue, 20 Sep 2022 07:01:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCD55F800F2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 07:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCD55F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hrc9u/Nu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F80AB82469;
 Tue, 20 Sep 2022 05:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1C3C433C1;
 Tue, 20 Sep 2022 05:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663650060;
 bh=JcZOwfCNW3dBfAsXNvo/jTqcE40QGR1s+zdpQNoCiQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hrc9u/NuNYtKURUjWKz2ISE9VZtxrhEVc/aAnu90Z3I/Jybpf7Dr831tnglAZegQz
 M4BRK41iaIh3aCOmhtvFh1DEt3QiBhU5hwny2E3kuqjS9MyMYCOjOgAei2m6SRqsh+
 cD3P9Oft5ecsL+gVKbqnEZcdPZRTBkBwMDJ+8FTboc4hdDbR6OuDvFybtxsnSOly/4
 aeBzxa4+ZRhGt5au9o7lxluzw2kusipuk/2R/2Z2ga4nTchyTdaGqc37MlH0Nh8A3a
 cCZ3iCsJXkhtK37OhFvK/OY9IA8Oq0VBDAeB/AjBwHbSiV1UZ3ts0cSB/J+zKrIWl2
 VLClmp7H5RkiA==
Date: Tue, 20 Sep 2022 10:30:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: cadence: Don't overwrite msg->buf during
 write commands
Message-ID: <YylJB+GfMxQL3ogS@matsya>
References: <20220916103505.1562210-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916103505.1562210-1-rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

On 16-09-22, 11:35, Richard Fitzgerald wrote:
> The buf passed in struct sdw_msg must only be written for a READ,
> in that case the RDATA part of the response is the data value of the
> register.
> 
> For a write command there is no RDATA, and buf should be assumed to
> be const and unmodifable. The original caller should not expect its data
> buffer to be corrupted by an sdw_nwrite().

Applied, thanks

-- 
~Vinod
