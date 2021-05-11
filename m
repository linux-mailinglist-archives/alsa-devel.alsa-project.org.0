Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC0837A67B
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 14:22:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42CD117BA;
	Tue, 11 May 2021 14:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42CD117BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620735765;
	bh=QrsUuDyGFvDNr+nehd7xg+P4MR9X+Ma7TQmOhrbi3Yo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dZBzg93IXzPyovmeJ0XnbsNYQrqNrj/aUd0odgbb5T6ihWBXimbJWRyk1UR10KUYi
	 Yx7LUrJRoei2JRSQM8snTfdRgo9TK9qOZNpXWDeUdBnM1nRpxGtt3FKyXvRKUBjazg
	 Iik8V9KiZIC9ecwSgVChMH/YdDV5KBuPmJuHYm9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8DCAF8016B;
	Tue, 11 May 2021 14:21:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89380F80163; Tue, 11 May 2021 14:21:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BE50F80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 14:21:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BE50F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bSqX6BNt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 044496187E;
 Tue, 11 May 2021 12:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620735661;
 bh=QrsUuDyGFvDNr+nehd7xg+P4MR9X+Ma7TQmOhrbi3Yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bSqX6BNtkBi/GquZJMM/o39GiMwbjVSbpFoZ/iW68jSUzVaWJtxJj4NjRIJgyydFg
 jbKJcWSUTA7mDBsAS0ZuqJquBiuUe/tx8NgStUar3t2jNFUeitdSzwS38YVbPuYJMp
 j01ugTrqEMgDn+xEL9hjSRIAFVtS0wX9P7D1R1Ug20b9E0QGXTzkGN68r/ixtFot1/
 BEQX7ayvKGMs/RF6DDW/z9FjzO3IGJbh+Zb/dhXdFAYwQt+6d0oCIYPhfSHfQy86qH
 +82Ar5DVP1UGhbdJJsEQ33DQCcpFfuKVIHZvX0D6VzoJe0Lj7wd6Z+jENifRIDUZVc
 FcKFOxGqSp+gg==
Date: Tue, 11 May 2021 17:50:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [RESEND PATCH] soundwire: dmi-quirks: remove duplicate
 initialization
Message-ID: <YJp2qYH1IQxDjgNA@vkoul-mobl.Dlink>
References: <20210511025035.25233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511025035.25233-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

On 11-05-21, 10:50, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> cppcheck warning:
> 
> drivers/soundwire/dmi-quirks.c:85:12: style: Redundant initialization
> for 'map'. The initialized value is overwritten before it is
> read. [redundantInitialization]
>   for (map = dmi_id->driver_data; map->adr; map++) {
>            ^
> drivers/soundwire/dmi-quirks.c:83:25: note: map is initialized
>   struct adr_remap *map = dmi_id->driver_data;
>                         ^
> drivers/soundwire/dmi-quirks.c:85:12: note: map is overwritten
>   for (map = dmi_id->driver_data; map->adr; map++) {
>            ^

Applied, thanks

-- 
~Vinod
