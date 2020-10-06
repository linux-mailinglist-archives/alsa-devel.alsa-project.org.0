Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3A42862CC
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 17:58:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB1DA1614;
	Wed,  7 Oct 2020 17:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB1DA1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602086292;
	bh=rDLLCAfcpbKWcjiDraDDSN94bLOF55Woeg1qUpEpZss=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YMgn2ons1reFrG+pVqUGxGbRWTS7+/ZeXuPeiNq8TfLf+8xibNPgqx+FQYN94piRS
	 UQhCG2QvDR/6tDUz/N/CNN6Ht8meffMlPFUSJxqxemNPTA7lvyY6LyOLoABKHWxFby
	 /yJOh/PXBwBI2ocwlC7WLRCXgRyx7Niiq7Phawq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D195F8026D;
	Wed,  7 Oct 2020 17:54:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E8C7F8012A; Tue,  6 Oct 2020 18:41:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CED7AF80127
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 18:41:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CED7AF80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1XMM2DnE"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18F01206D4;
 Tue,  6 Oct 2020 16:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602002466;
 bh=rDLLCAfcpbKWcjiDraDDSN94bLOF55Woeg1qUpEpZss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1XMM2DnEL0suZYEsKoQ4gvHK221+DNjzTkhDb/jC68bGBPrpJ47KmZGY2Dhmaz9XA
 FTLdSzUXsJbqwg5/8kCi8kMUuiG2QmvADxuduTSykB/Dd179CGtmxw8jo2YYzEa+GA
 608bhe780TJ8H8CeosB+67BzvasTbDhIVpDDq1Oc=
Date: Tue, 6 Oct 2020 18:41:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v5 22/52] docs: get rid of :c:type explicit declarations
 for structs
Message-ID: <20201006164152.GB36638@kroah.com>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
 <1f9d7dfd5e8557b55218af01045331939f1add28.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f9d7dfd5e8557b55218af01045331939f1add28.1601992016.git.mchehab+huawei@kernel.org>
X-Mailman-Approved-At: Wed, 07 Oct 2020 17:54:46 +0200
Cc: alsa-devel@alsa-project.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.de>, Tom Rix <trix@redhat.com>,
 linux-fpga@vger.kernel.org,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>,
 linux-mm@kvack.org, Mike Rapoport <rppt@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Satya Tangirala <satyat@google.com>,
 Eric Biggers <ebiggers@kernel.org>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-media@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-fscrypt@vger.kernel.org, Moritz Fischer <mdf@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Puranjay Mohan <puranjay12@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
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

On Tue, Oct 06, 2020 at 04:03:19PM +0200, Mauro Carvalho Chehab wrote:
> The :c:type:`foo` only works properly with structs before
> Sphinx 3.x.
> 
> On Sphinx 3.x, structs should now be declared using the
> .. c:struct, and referenced via :c:struct tag.
> 
> As we now have the automarkup.py macro, that automatically
> convert:
> 	struct foo
> 
> into cross-references, let's get rid of that, solving
> several warnings when building docs with Sphinx 3.x.
> 
> Reviewed-by: André Almeida <andrealmeid@collabora.com> # blk-mq.rst
> Reviewed-by: Takashi Iwai <tiwai@suse.de> # sound
> Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
