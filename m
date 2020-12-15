Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3493B2DA6C3
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 04:27:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B059B17A6;
	Tue, 15 Dec 2020 04:26:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B059B17A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608002843;
	bh=nISXN7qbXnSxjJGCe3bl2UFATf80YBtLI3ToMf/Ktdk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dqZbpFtGnLJoTBXF3CYIY/Ug/7TNN9Ze6wyFAuHhH3acfuxI3t38fwA06eUu9gDk2
	 AqBCjzj5tKFKXwI0VaVC7sw8tGTxSEn18/73P+TbkRXbS22lw4o3DCeGQ5D/92KAtp
	 VCQrUOTGnVtzxALuDGYoAAJUDCaFkzBV49CCqjrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37E23F80278;
	Tue, 15 Dec 2020 04:25:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AF72F8027B; Tue, 15 Dec 2020 04:25:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from omr2.mail.isx.net.nz (omr2.mail.isx.net.nz [111.65.230.131])
 (using TLSv1 with cipher ADH-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 090C2F8014B
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 04:25:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 090C2F8014B
Received: from [10.36.0.145] (unknown [27.252.196.81])
 (Authenticated sender: eliot@blennerhassett.gen.nz)
 by omr2.mail.isx.net.nz (Postfix) with ESMTPA id F011C937A93;
 Tue, 15 Dec 2020 16:25:31 +1300 (NZDT)
Subject: Re: [PATCH v2] ASoC: AMD Renoir - add DMI table to avoid the ACP mic
 probe (broken BIOS)
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
Newsgroups: gmane.linux.alsa.devel,gmane.linux.kernel.stable
References: <20201208171200.2737620-1-perex@perex.cz>
From: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>
Message-ID: <e1097123-6f22-8921-0415-248958c2a952@blennerhassett.gen.nz>
Date: Tue, 15 Dec 2020 16:25:28 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201208171200.2737620-1-perex@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

On 9/12/20 6:12 am, Jaroslav Kysela wrote:
> Users reported that some Lenovo AMD platforms do not have ACP microphone,
> but the BIOS advertises it via ACPI.

Can you briefly explain how to confirm that this specific problem
exists, and what info you would need from me to add a new machine?


I have a Lenovo E14 Gen 2 with AMD that claims to have DMIC but no
evidence of it working.

My workaround so far has been blacklisting the related modules...
blacklist snd-soc-dmic
blacklist snd-acp3x-rn
blacklist snd-acp3x-pdm-dma

alsa-info:
http://alsa-project.org/db/?f=0c4d6f062e6065d47ee944f5953f0aaa328d4b44

--
Eliot

