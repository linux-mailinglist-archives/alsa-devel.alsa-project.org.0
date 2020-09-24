Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1241C27761E
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 18:02:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE5BE17EC;
	Thu, 24 Sep 2020 18:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE5BE17EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600963356;
	bh=Xdvv5FBToALWWRukceoyN+3PafN1eD2S03PDFf4+qO8=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=azKjF32BNtjxuTsgj3cSRlYF9OXjTNMkugW6UmwSl4WtBtSg1RaJVt5fhg2E5Puzr
	 l9xie8SNm1Ymx+Wob/cj+cDyfQvYT8VoJcZbjk2r/o0noI3mrNlrkgaxdLn8ap3UdG
	 5wRsyMl/WPXypha9SHuyxfglnfzQpr1c0NH2XLeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F1BEF800B4;
	Thu, 24 Sep 2020 18:01:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09A67F8023E; Thu, 24 Sep 2020 18:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0181.hostedemail.com
 [216.40.44.181])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1591EF800B4
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 18:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1591EF800B4
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 1629A18029140;
 Thu, 24 Sep 2020 16:01:24 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: sign82_1c0725327160
X-Filterd-Recvd-Size: 1336
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Thu, 24 Sep 2020 16:01:22 +0000 (UTC)
Message-ID: <062568971307793dcc80337f85545c4765241933.camel@perches.com>
Subject: Re: [PATCH] sound/soc/codecs: fix spelling typo in comments
From: Joe Perches <joe@perches.com>
To: Mark Brown <broonie@kernel.org>, Wang Qing <wangqing@vivo.com>
Date: Thu, 24 Sep 2020 09:01:21 -0700
In-Reply-To: <20200924123346.GE4754@sirena.org.uk>
References: <1600929860-28862-1-git-send-email-wangqing@vivo.com>
 <20200924123346.GE4754@sirena.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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

On Thu, 2020-09-24 at 13:33 +0100, Mark Brown wrote:
> On Thu, Sep 24, 2020 at 02:43:59PM +0800, Wang Qing wrote:
> > Modify the comment typo: "compliment" -> "complement".
> 
> These are both English words,

with rather different meanings.

> and compliment appears to be the one that
> is used in the datasheet for this part... 

It's difficult to fix datasheet typos.


