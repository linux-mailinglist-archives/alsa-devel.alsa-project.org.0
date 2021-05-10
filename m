Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE9D3797D2
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 21:40:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60D211767;
	Mon, 10 May 2021 21:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60D211767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620675658;
	bh=gIY6xpy+YkgkXUd3VcWQgTd5iJ66pk8tvV7WQdKq/IU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aqnGmSKU3c1QNr8fP7DXASsNY0mYuEgzpGIDDjZBwS0zBiu9p1JmsaFqve4Bj9L8n
	 yX0yASzsOhAC7ubbPB6t3pv34bmI/l3jGriAVetoVBJuM7mFF5wRyuCAE5Ml0xtFWC
	 /JLAchGiS78fQCEVDMAtk8DcP42xto70JTKSVKLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB5B2F8026F;
	Mon, 10 May 2021 21:39:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B21CAF800E9; Mon, 10 May 2021 21:39:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69DC0F800E9
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 21:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69DC0F800E9
IronPort-SDR: p22FadrXI7jdSJelYxKc923AQyE1/GkrqtNZBCyaIVbiHXXuIKlJceKOOvPUVz9eKx2TwSPLts
 YrlGa5zbz0Jw==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="263202408"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; d="scan'208";a="263202408"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 12:38:57 -0700
IronPort-SDR: gvwR8JLyAoAcyvn6r3060yndD8amI2z5EEvzb9n+bpLzuONlNL3fkao+lFXGVMr5QUvaKhUfVm
 83xK6Gr+UwSQ==
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; d="scan'208";a="436274476"
Received: from tcjohnst-mobl1.amr.corp.intel.com (HELO [10.255.67.148])
 ([10.255.67.148])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 12:38:55 -0700
Subject: Re: [PATCH 00/10] Tidy up device ID reading on legacy Cirrus parts
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
References: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dbcede97-4f62-2422-55a8-bccf9f8a4c09@linux.intel.com>
Date: Mon, 10 May 2021 09:59:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com, lgirdwood@gmail.com, james.schulman@cirrus.com
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



On 5/10/21 8:13 AM, Charles Keepax wrote:
> Pierre requested I have a look at some cppcheck warnings in the cs42l42
> driver, since it is reassigning the ret variable without ever checking
> the result.  Looking a bit more broadly this happens in quite a few
> legacy Cirrus parts, as they all use the same process to read the ID,
> factor out a small helper so they can all share the same code. Whilst
> in there fix up a couple of other trivial error path issues as well.
> 
> Thanks,
> Charles
> 
> Charles Keepax (10):
>    ASoC: cirrus: Add helper function for reading the device ID
>    ASoC: cs35l32: Minor error paths fixups
>    ASoC: cs35l33: Minor error paths fixups
>    ASoC: cs35l34:  Minor error paths fixups
>    ASoC: cs35l35:  Minor error paths fixups
>    ASoC: cs35l35: Correct errata handling
>    ASoC: cs42l42:  Minor error paths fixups
>    ASoC: cs42l73:  Minor error paths fixups
>    ASoC: cs43130:  Minor error paths fixups
>    ASoC: cs53l30:  Minor error paths fixups

Sounds all good to me, just wondering if while you're at it you can fix 
the remaining minor issues? Thanks!

cppcheck --platform=unix64 --force --max-configs=1024 --inconclusive 
--enable=all --suppress=variableScope --suppress=shiftTooManyBitsSigned 
--suppress=arithOperationsOnVoidPointer --suppress=bitwiseOnBoolean 
sound/soc/codecs/cs*.c

sound/soc/codecs/cs35l36.c:1159:10: style: Variable 'ret' is assigned a 
value that is never used. [unreadVariable]
  int ret = 0;
          ^
sound/soc/codecs/cs4265.c:619:6: style: Variable 'ret' is reassigned a 
value before the old one has been used. [redundantAssignment]
  ret = devm_snd_soc_register_component(&i2c_client->dev,
      ^
sound/soc/codecs/cs4265.c:604:6: note: ret is assigned
  ret = regmap_read(cs4265->regmap, CS4265_CHIP_ID, &reg);
      ^
sound/soc/codecs/cs4265.c:619:6: note: ret is overwritten
  ret = devm_snd_soc_register_component(&i2c_client->dev,
      ^
sound/soc/codecs/cs42l52.c:1202:6: style: Variable 'ret' is reassigned a 
value before the old one has been used. [redundantAssignment]
  ret =  devm_snd_soc_register_component(&i2c_client->dev,
      ^
sound/soc/codecs/cs42l52.c:1165:6: note: ret is assigned
  ret = regmap_read(cs42l52->regmap, CS42L52_CHIP, &reg);
      ^
sound/soc/codecs/cs42l52.c:1202:6: note: ret is overwritten
  ret =  devm_snd_soc_register_component(&i2c_client->dev,
      ^


> 
>   sound/soc/codecs/cirrus_legacy.h | 21 +++++++++++++++++++++
>   sound/soc/codecs/cs35l32.c       | 34 ++++++++++++++++++----------------
>   sound/soc/codecs/cs35l33.c       | 15 +++++++++------
>   sound/soc/codecs/cs35l34.c       | 39 ++++++++++++++++++++++-----------------
>   sound/soc/codecs/cs35l35.c       | 21 ++++++++++-----------
>   sound/soc/codecs/cs35l35.h       |  1 +
>   sound/soc/codecs/cs42l42.c       | 18 ++++++++----------
>   sound/soc/codecs/cs42l73.c       | 30 +++++++++++++++++-------------
>   sound/soc/codecs/cs43130.c       | 31 +++++++++++++++++++------------
>   sound/soc/codecs/cs53l30.c       | 22 +++++++++++-----------
>   10 files changed, 136 insertions(+), 96 deletions(-)
>   create mode 100644 sound/soc/codecs/cirrus_legacy.h
> 
