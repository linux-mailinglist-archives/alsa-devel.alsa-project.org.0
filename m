Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2834C104898
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 03:39:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B58CC1735;
	Thu, 21 Nov 2019 03:38:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B58CC1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574303956;
	bh=+Y5QXr+JDyeXLAMrvToUjcnrpP6E/80wlaULNb/PKGs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XnpPFYB7Q175qjNYZExHcp4WRJKy2WxV9VAfZYjI/ndsik+2ag8SUe9rXcn3ElHmY
	 9/rS8vOQ9og8JBnYzdHhMeF50JXn9plPFH2DprzS+lEzMtgwgvXmZzJ6IAJdLWoHIF
	 a38wxZ+Un240QywhVLzzc0nA7WsAIxzDDpzTXB0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E27C4F80146;
	Thu, 21 Nov 2019 03:37:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CF86F80146; Thu, 21 Nov 2019 03:37:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 954D2F800EF
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 03:37:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 954D2F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rl/r+9sW"
Received: by mail-io1-xd41.google.com with SMTP id r2so1570398iot.10
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 18:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vl8ymJV2CLxMl30my9zOJN456THcvXV20UDJgXZy9Mk=;
 b=rl/r+9sWvIp81fDapnfylpa/AtzK7izXYrnGU1APozqomtYhMpyaltbGkMRlwWusYh
 F1uLv2I/oafPgxFAjjza9EZE1DFpHLuft1qerGriTOekYg87e+SCbSfND5MOwaaW2EwG
 gKf41xhzZBIrbUgiSpPsB/1HSQy/lYT3Wy80J9GbKTBmPKdNYSLpM6MJpa6uOfhltVQz
 EIa9xdIowc3q0uwiNJHjprB0ReYv9acOBz/zIXFqsI5zzOyttMfb1tMFe2K5HsIvoARq
 ZUspcngPZ+q77AOlUR5dSgErhSDhH3nfnepNidCzClMdLwYxLJZtVqcd4dVxeTaBZutl
 INBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vl8ymJV2CLxMl30my9zOJN456THcvXV20UDJgXZy9Mk=;
 b=Rs9B5y7r6IYKPkvkoJjlRMzpDnbjf8EWCo+xlL8TAe92yyshQBbfe8OR+DYyINaGgU
 CqsxKtsswi1kiMKwQFSAtdHf1g7jMzzNV6q1fUhEWULhNu9iUh0aAsxRRwWWSGBsv5DZ
 pvj10c2MT6pNnJV73WrRVO+ADKJuk3JBbA/LTZhMPaNOcXIBs4FW6SspZDc6SeoYWWQ8
 F/w6l40i//QSQfhGNRR5dcyy0qTM+vEbl8VTvPbm30u6DsAdueBSYZUQ5Nrz/UNm+Xm/
 3Cc4xI2vX8ArOPaj3vpZ7ofUrklaQNiiU2A5ueS9B9ZD6pTz9LEpeLoYqdPQXrR4A0EA
 Dqnw==
X-Gm-Message-State: APjAAAUiuqOUmuHwJMo5SiMKCPKcxL7A+vXaNuVf3sFv5umy4+nFKEgr
 9OB5HREp4RUw7LZc7xWSBrBHi3LCctuoEXqr5AlVVA==
X-Google-Smtp-Source: APXvYqx39K4VvmiZoTA+DHv7wxjizrxvYm4Dag03ASU/FhpfSCe2ANkKb9jAsUhuqXZoChH3A7fQIs4uT1nKtgTBl0w=
X-Received: by 2002:a6b:ec08:: with SMTP id c8mr629090ioh.257.1574303845251;
 Wed, 20 Nov 2019 18:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20191120060256.212818-1-tzungbi@google.com>
 <20191120060256.212818-2-tzungbi@google.com>
 <a0ad3c80-c5e7-f875-7c97-e0e0dc36bfc0@linux.intel.com>
In-Reply-To: <a0ad3c80-c5e7-f875-7c97-e0e0dc36bfc0@linux.intel.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 21 Nov 2019 10:37:13 +0800
Message-ID: <CA+Px+wW6JHfw0KcnBtHC2RdDL4uj=OAsDvxh45Q5O6DbD4Dunw@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: max98090: remove msleep in PLL
 unlocked workaround
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

On Thu, Nov 21, 2019 at 12:10 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> maybe add a comment here that the off/on sequence is done on purpose (as
> stated in the commit message)?

Will do, thanks.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
