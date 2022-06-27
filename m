Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD19A55B905
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 11:53:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BF6BAE9;
	Mon, 27 Jun 2022 11:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BF6BAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656323617;
	bh=2/gDrUTu6L5xIMpIRFFxM1ZD3r+X4pClBcxRNbhDrJs=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MmkegPqafVkCzL56nmA1plXlBqzWRa9x2G0veUiAZ6aqFYUJk3XvikATqfDzC1NXV
	 0w1fL7XlDO3vk7tlxy8UEtniIchdWlrEnrS2xD5tvSgRzbr7kksuMuVu/gpOcRGjSa
	 8mE0EAN7TOVZdr3wThA8+aAC1THiDbSkR7OqqQMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05160F8028D;
	Mon, 27 Jun 2022 11:52:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E386F80128; Mon, 27 Jun 2022 11:52:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 8F3C1F80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 11:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F3C1F80128
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id C356D8106;
 Mon, 27 Jun 2022 09:47:16 +0000 (UTC)
Date: Mon, 27 Jun 2022 12:52:25 +0300
From: Tony Lindgren <tony@atomide.com>
To: Grazvydas Ignotas <notasas@gmail.com>
Subject: Pandora audio using machine_is_omap3_pandora() check
Message-ID: <Yrl92RILZwhQOP+e@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-omap@vger.kernel.org
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

Hi Grazvydas,

Arnd noticed that pandora audio is using machine_is_omap3_pandora() check
that never succeeds for devicetree booting machines. Looks like this has
been broken at some point many years ago with the devicetree conversion.

Does anybody have an interest in fixing this driver?

Regards,

Tony
