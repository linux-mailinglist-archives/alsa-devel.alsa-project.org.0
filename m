Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE030294A8C
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 11:30:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B7201737;
	Wed, 21 Oct 2020 11:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B7201737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603272617;
	bh=zLtH7PTAGL7fqWpdFdru6y56Vuf2R6QhNmddOQ3wXZA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XJNAxmKIBfI3McftYudeHWzoGlLxoatpXwO+4SlAVGL8lBejMmjnMrSvdwHQlHWz6
	 NT/Ekvkjo2Qf1x4mKHbRInG74m0X6Q9RlW9nhCEmcTCgMVvL89kZ8xdvGWaHnA8tfS
	 qYtypmsSJViWE2Czxsp3Lp2TqbgR5NpYq0bCAIYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35BB5F8011C;
	Wed, 21 Oct 2020 11:28:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D88CF80264; Wed, 21 Oct 2020 11:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5484F80111
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 11:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5484F80111
IronPort-SDR: ZWqg3X0+3vOMvPGeNrJIp//bjrPk8PbcCZIwe27OZv0Zg9r9hz9q2gVYtLpzr7xcLBWD1mYfgP
 GAi2G9gnJHiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="164733563"
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="164733563"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 02:28:19 -0700
IronPort-SDR: aWWLbemHqtBu9CB7MlasuVjGUL1vP6vhBPSUnnLyk7Iuf+PSe07DZXqQMO++7ie0lWz26CBjQ3
 8e1pzMu4F9ew==
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="466233453"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 02:28:18 -0700
Date: Wed, 21 Oct 2020 12:26:22 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [GIT PULL] ASoC updates for v5.10
In-Reply-To: <0cfec32c-c0b4-ddbc-6a23-f5b898966c48@perex.cz>
Message-ID: <alpine.DEB.2.22.394.2010211150040.864696@eliteleevi.tm.intel.com>
References: <20201012130845.816462076C@mail.kernel.org>
 <a31e2b24-9ef4-c84f-a663-c2a44b0c8938@perex.cz>
 <20201012132857.GC4332@sirena.org.uk>
 <0cfec32c-c0b4-ddbc-6a23-f5b898966c48@perex.cz>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
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

Hi,

On Wed, 21 Oct 2020, Jaroslav Kysela wrote:

> Another week and this is ignored. At least, I cannot find this simple patch
> set in your for-5.10 tree. I don't care about the cosmetic code fixes, but the
> last warning suppression can reduce the maintainer / user confusions ("ASoC:
> SOF: loader: handle all SOF_IPC_EXT types").

maybe bundling the warning suppression to the same patchset was not the 
best of ideas. Jaroslav is correct the warnings can unfortunately create 
real confusion as this is on a code path we run on every rt-resume, and if 
you happen to have a system with FW that has some custom IPC types, you'll 
get this warning constantly in dmesg.

We did a cleanup of SOF dmesg noise in 5.8, but unfortunately this one 
slipped through.

Br, Kai
