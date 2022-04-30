Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1886515E88
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Apr 2022 17:02:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BC5A1F4;
	Sat, 30 Apr 2022 17:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BC5A1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651330944;
	bh=Ajnucx/H/ioVOWtM+z252WJjKeKWS+lbUTXB0YVIvko=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QvaaN3kG8MLX2ND+Y4w5Mjpp4Hbenzvc+Xv3w939ESMcC9jFbQDSkN8/QPa0/Puuh
	 WBv8s0y2XzfIBc05akeEkiX2CSGU9k2q8HZBkHQYu4lYnn5Qa9ZgusbKkX3qnTNmex
	 OZFDnQgJVyJaGDmUkp5AILW5PCRUL4Cr+A4QAMPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF829F8012B;
	Sat, 30 Apr 2022 17:01:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A02DDF80125; Sat, 30 Apr 2022 17:01:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FEB3F80125
 for <alsa-devel@alsa-project.org>; Sat, 30 Apr 2022 17:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FEB3F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="cyIUBA6p"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 477AFB8013B;
 Sat, 30 Apr 2022 15:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4BCC385A7;
 Sat, 30 Apr 2022 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651330875;
 bh=Ajnucx/H/ioVOWtM+z252WJjKeKWS+lbUTXB0YVIvko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cyIUBA6pqqg/B5wyOdcBDSKNfjtyMoj5sWt3Xdh4pX+zHEGGcxKJ95CN6T0JFdHby
 hV9/K8uobLdNYn/ulaPsgu8Fx2ZaTb2Xue2Dzv8mIqmlZJHvELez5fJErThevr2fUv
 pPLrIsIA43sEFEbS80j0j1nzwT++PjVZBIhE1KHg=
Date: Sat, 30 Apr 2022 17:01:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 1/2] module: update dependencies at try_module_get()
Message-ID: <Ym1POJ58psy2UBUo@kroah.com>
References: <cover.1651326000.git.mchehab@kernel.org>
 <a403bfabca4ce587ddd275f2a3c1dfc1d99bda86.1651326000.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a403bfabca4ce587ddd275f2a3c1dfc1d99bda86.1651326000.git.mchehab@kernel.org>
Cc: alsa-devel@alsa-project.org, mauro.chehab@linux.intel.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Kai Vehmanen <kai.vehmanen@intel.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Dan Williams <dan.j.williams@intel.com>,
 linux-modules@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

On Sat, Apr 30, 2022 at 02:41:47PM +0100, Mauro Carvalho Chehab wrote:
> Sometimes, device drivers are bound into each other via try_module_get(),
> making such references invisible when looking at /proc/modules or lsmod.
> 
> Add a function to allow setting up module references for such
> cases, and call it when try_module_get() is used.
> 
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

