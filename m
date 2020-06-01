Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2AB1EA633
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 16:47:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBB5616ED;
	Mon,  1 Jun 2020 16:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBB5616ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591022823;
	bh=WlamRrbO5g3mcokof7870OEB6/IsRbOzYOLHmUQKzwk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l5Xhu/B6sL/gDjBj+0TEcody+mKAU4etd5C6EESSw8VTDO1fCtitcz3AKzNPyWp9U
	 dJHw4OGPBOpS0sq+kNbIjlHNG858GYKRqdWJa2l0NNdoGy133XN2nIW674HxSaKxwn
	 v8fMq99ytd0kOmtVFPATU/+ej6cmj6Pgptr2Tg6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDCB5F801F5;
	Mon,  1 Jun 2020 16:45:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FD14F801ED; Mon,  1 Jun 2020 16:45:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11748F800B8
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 16:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11748F800B8
IronPort-SDR: XOcnKY0qdhd8hiaBPT/TiOtenYB9ou3JzdpvrIaVxmRzijplzECGzRfozjXZ0rIKMAYCSOASMd
 2iY5aEugf7Pw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 07:45:05 -0700
IronPort-SDR: j7gGGeL34XJQjhIrz+UaxtPiBQ8+KzF6NEj4fknFgvjU9ZZWhUZa/jn7NyZexEcY9XWRuRuTbD
 fPyMHEPhKerw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,461,1583222400"; d="scan'208";a="268340625"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 01 Jun 2020 07:45:04 -0700
Date: Mon, 1 Jun 2020 17:45:03 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: SOF 1.5 release on FTP server
In-Reply-To: <15e6517a-6be2-d5cd-c5d7-37a5122bd96e@perex.cz>
Message-ID: <alpine.DEB.2.21.2006011723250.3787@eliteleevi.tm.intel.com>
References: <CALZj-VpLECyDaBeHcowTnCcufLVaPyr7Xxii+PbkrwGn9kYU+w@mail.gmail.com>
 <bc8420df-3fbe-2d7c-3c3a-dcf7455eeca8@perex.cz>
 <CALZj-VoLtoNbPZ1evLYqTxEg7XaTiEjgdB+WLE7duLfxF2ohLA@mail.gmail.com>
 <15e6517a-6be2-d5cd-c5d7-37a5122bd96e@perex.cz>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Paul Dann <pdgiddie@gmail.com>
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

On Mon, 1 Jun 2020, Jaroslav Kysela wrote:

> Dne 01. 06. 20 v 10:14 Paul Dann napsal(a):
> > Hi Jaroslav; many thanks for the fast response. It does seem that the
> > Github version is missing a number of files that are present in your
> > FTP version. I'd just like to check this doesn't represent a loss of
> > functionality?
> 
> My FTP packages also include all unsigned firmware files compiled with gcc.
> They are unusable for the most Intel platforms where only signed firmware
> files can be loaded to DSP (security).

Paul, I can confirm the sof-bin is the definitive location to get
the SOF binaries.

> BTW: Fixed topology files for v1.5 (generic sof hda):
> 
> https://www.alsa-project.org/files/pub/misc/sof/sof-bin-topology-1.5-dmic-20db-fix.tar.gz
> 
> Use this on top of the sof-bin repo / v1.5 branch if you like. It seems that
> the fix in sof-bin is delayed.

We also now have a stable release 1.4.3 available:
https://github.com/thesofproject/sof-bin/tree/stable-v1.4.3

... this helps to fix the freeze issue seen on some laptops with SOF 1.4.2 
(e.g. https://github.com/thesofproject/linux/issues/1917 Paul you've 
reported).

1.5.1 is indeed delayed. We are trying to expedite the process.

Br, Kai
