Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B25C25A6C48
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 20:34:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E671616A5;
	Tue, 30 Aug 2022 20:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E671616A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661884457;
	bh=XsUE1WX2iPvSslSTLpbqIWw0tekCnX+Peis1JK0+aMI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ho3JIyvkne5rdROoH70kronzoBynRI7Vk3TSfH2+b2gN8bGLF3HoSOoA4cJshEghS
	 JFFEaHu/+ZKwU4uSPHfaaR8p06hmK6xN2LxS6n+YkBeX2M+BOae45CBVvquNq3+OQY
	 AbA0jjMDT2Ka5WjnrF5augHRlMTNuPYlY+9Ek8Nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F355F8032B;
	Tue, 30 Aug 2022 20:33:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C163AF8023A; Tue, 30 Aug 2022 20:33:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C35EF8012A
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 20:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C35EF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="oPO8HBOu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WEmQN+6Nw20owgW81yaoQaqKOSVpiLyZb3sg8Y1rIiw=; b=oPO8HBOuU4ELWQw0nJ93ViKWT0
 yyEf9j8EVAGjU+Mgm+4W3xATroP2LLFq3ZKBZuyRF6optEsL1uplSH+28bKdhvJeYLA2rlqBMq/ia
 UHgOtVLzm96UdmYim94H1rxEVddp4xubb2i7gP7XLO2qhyY4KI+tBQzWTAoH0BON0glx7myauqHSX
 jTl/6HdQKyk/d+hJXlzDczGI4fVjsm2rq/8c4JM897q+so9IHHkDwm2YYRvB5aVQjLPrkrwte9Pd7
 0mL9I+sXyk7T2oxLx1T92EC7F2OkVuWAzFoFkex93tsvPDYpOht8dqkfsLQhf/aaSTUxVda7QbFMN
 0WSFEzww==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oT62p-004K31-S7; Tue, 30 Aug 2022 18:33:03 +0000
Date: Tue, 30 Aug 2022 19:33:03 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 1/2] libfs: Introduce tokenize_user_input()
Message-ID: <Yw5X379ct1PK6wZO@casper.infradead.org>
References: <20220825164833.3923454-1-cezary.rojewski@intel.com>
 <20220825164833.3923454-2-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825164833.3923454-2-cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 andy.shevchenko@gmail.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 linux-fsdevel@vger.kernel.org, peter.ujfalusi@linux.intel.com,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
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

On Thu, Aug 25, 2022 at 06:48:32PM +0200, Cezary Rojewski wrote:
> Add new helper function to allow for splitting specified user string
> into a sequence of integers. Internally it makes use of get_options() so
> the returned sequence contains the integers extracted plus an additional
> element that begins the sequence and specifies the integers count.
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  fs/libfs.c         | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h |  1 +

This really has nothing to do with filesystems.  Surely
string_helpers.[ch] is the appropriate place for this code?
Also get_options() should probably move its prototype from kernel.h to
string_helpers.h.
