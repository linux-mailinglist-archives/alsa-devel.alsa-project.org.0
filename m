Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F7F7119
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 10:46:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1120F82B;
	Mon, 11 Nov 2019 10:45:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1120F82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573465565;
	bh=qWwy4kFnqztI6xQBXJ3WuwJxp39oIhLc81Rn9Qb3iZA=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mzm5O1Ic8sl1Wd/DzMMJohvQKUS5GlBCnP/kY5lirQ07eBRoDUP4COtm0D2KcRN8a
	 eSK3/yMIZJykCYjPjA3Xjlnq2Dps8We1ZWiUkpYGyYcjcOaIy8wdkm8UvZYhYT1mBw
	 jrIz5DgD853jdHfrKX+C8VDY5PulCuc65nRaB0Zo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8008FF802E0;
	Mon, 11 Nov 2019 10:44:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD597F8045D; Mon, 11 Nov 2019 10:44:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B924FF802E0
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 10:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B924FF802E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 01:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,292,1569308400"; d="scan'208";a="378441926"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga005.jf.intel.com with ESMTP; 11 Nov 2019 01:44:09 -0800
Date: Mon, 11 Nov 2019 11:44:08 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Curtis Malainey <cujomalainey@chromium.org>
In-Reply-To: <20191107015808.26844-1-cujomalainey@chromium.org>
Message-ID: <alpine.DEB.2.21.1911111125240.16459@zeliteleevi>
References: <20191107015808.26844-1-cujomalainey@chromium.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 01/11] ucm: docs: Add JackName value
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Curtis,

On Wed, 6 Nov 2019, Curtis Malainey wrote:

> This field represents the input device name for a jack detection line
> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>

this series looks good to me and I think it's a very good idea to bring 
extensions that have proven useful in Chromium to alsa-lib.

For reviewing, a bit of background context and pointers would probably 
help the wider audience. E.g. I found this very useful:

https://www.chromium.org/chromium-os/chromiumos-design-docs/cras-chromeos-audio-server
-> 
https://docs.google.com/document/d/1AcXZI9dvJBW0Vy6h9vraD7VP9X_MpwHx0eJ6hNc4G_s/edit?usp=sharing

Not directly related to this series, but it would be nice if the 
versioning would be aligned as well (especially now as ucmv2 is being 
proposed).

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
