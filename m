Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C47AA1F3A19
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 13:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E6251698;
	Tue,  9 Jun 2020 13:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E6251698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591703502;
	bh=TR7BWkHZPKTqWbzOGU3jKxr3Mt5VPTsUorZndo5CcAk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lCca4TP5yA2MNfjPCVEw+EJT0RljUciSDray87m01zdgFQrdcABNsvgIE1Uv1psWd
	 O8gMEoVfJ+U4cBg44kX3AYCytfpnnu9TqO4tICv4m+lPocPKJgMrEA00F6UKhf1QgZ
	 gzrctuUKlGT77ECCjMHrRQkF1K6d2LUKnT1tmPzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FFE2F80278;
	Tue,  9 Jun 2020 13:50:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEA09F8028C; Tue,  9 Jun 2020 13:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3032F80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 13:49:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3032F80124
Received: by verein.lst.de (Postfix, from userid 2407)
 id 40B2D68AFE; Tue,  9 Jun 2020 13:49:55 +0200 (CEST)
Date: Tue, 9 Jun 2020 13:49:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: next-0519 on thinkpad x60: sound related? window manager crash
Message-ID: <20200609114955.GA2027@lst.de>
References: <20200609054306.GA9606@lst.de> <s5hsgf4irzt.wl-tiwai@suse.de>
 <20200609084305.GA21671@lst.de> <s5hlfkwip1h.wl-tiwai@suse.de>
 <20200609091727.GA23814@lst.de> <s5hh7vkio0n.wl-tiwai@suse.de>
 <20200609113123.GA547@lst.de> <s5h3674ii49.wl-tiwai@suse.de>
 <20200609114059.GA1228@lst.de> <s5hzh9ch38h.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hzh9ch38h.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, x86@kernel.org, hpa@zytor.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>,
 hch@infradead.org, mingo@redhat.com, bp@alien8.de, Pavel Machek <pavel@ucw.cz>,
 David Rientjes <rientjes@google.com>, tglx@linutronix.de,
 Christoph Hellwig <hch@lst.de>
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

On Tue, Jun 09, 2020 at 01:45:34PM +0200, Takashi Iwai wrote:
> Yes, for the sound stuff, something below should make things working.
> But it means that we'll lose the SG-buffer allocation and the
> allocation of large buffers might fail on some machines.

We crossed lines there.  In general due to better memory compaction and
CMA we have better chances to get larger contiguous allocations these
days, so this might not be too much of an issue in practice.
