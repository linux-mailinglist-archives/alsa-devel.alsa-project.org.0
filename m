Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BC55D631
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 20:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E43E1695;
	Tue,  2 Jul 2019 20:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E43E1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562092535;
	bh=U206brzhXg50MyzncYL0fX4u5t+9yu16mlPUx9g5wQ0=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hkeFtT1T92CDJKr7Swlaooz3f2bMXcm1GzQPPtqm1u4ssOXNgkFMcYzp51SlBVmq3
	 OcqTj1ZaX37wTkp96w3MmOR9a/B4j1kz8ed1JK4DbtIfR38yqZlF+R9qZPkoHOwjEt
	 4jNEqdJhuvGvOKPToqw7YSYrsA9uDDWe5TEfTmTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C79D6F800EA;
	Tue,  2 Jul 2019 20:32:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C920F896EC; Mon,  1 Jul 2019 10:56:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9476F80CC4
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 10:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9476F80CC4
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: by mail.steuer-voss.de (Postfix, from userid 1000)
 id EB700440A7; Mon,  1 Jul 2019 10:55:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.steuer-voss.de (Postfix) with ESMTP id E3B7F42021;
 Mon,  1 Jul 2019 10:55:59 +0200 (CEST)
Date: Mon, 1 Jul 2019 10:55:59 +0200 (CEST)
From: Nikolaus Voss <nv@vosn.de>
X-X-Sender: nv@fox.voss.local
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20190628143037.GH5379@sirena.org.uk>
Message-ID: <alpine.DEB.2.20.1907011055090.2390@fox.voss.local>
References: <20190628123416.16298-1-nikolaus.voss@loewensteinmedical.de>
 <20190628143037.GH5379@sirena.org.uk>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Jul 2019 20:32:21 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, "Andrew F. Davis" <afd@ti.com>,
 linux-acpi@vger.kernel.org, Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [alsa-devel] [PATCH] sound/soc/codecs/tas5720.c: add ACPI
	support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 28 Jun 2019, Mark Brown wrote:
> On Fri, Jun 28, 2019 at 02:34:16PM +0200, Nikolaus Voss wrote:
>> Add support for ACPI enumeration for tas5720 and tas5722.
>> Use device_match API to unify access to driver data for DT and ACPI.
>> Aggregate variant stuff into its own struct and directly reference
>> it in variant data for i2c/of/acpi_device_id.
>
> Please use subject lines matching the style for the subsystem.  This
> makes it easier for people to identify relevant patches.
>
> There's a huge amount of refactoring in here as well as the enumeration
> changes, please split this up into a patch series as covered in
> submitting-patches.rst for review.
>

Ok, thanks for the feedback, I'll prepare a series.

Nikolaus

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
