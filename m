Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C95E4675A5
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 11:53:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9C1C21D5;
	Fri,  3 Dec 2021 11:52:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9C1C21D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638528806;
	bh=op4eAE5EgTPUDMc1d3nHBpyqAaeQn5ReEbLsvsAx7S0=;
	h=Subject:From:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UsrALx2qMU88nLPZv3KIIsgK6rm5LjrqVtalKyR8Rl5R564XeyREWRcaYywAmDp45
	 nWmcBDKZWY0qGio+UD8MdEpQQ54AEc8ACiXa01s/g/iGVX1nDGc5VQ1DhTxpMAW1A9
	 dgAzF7TgVshi2HOEDy3f53I4pouWvKPvyqPZdPxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 026FFF80249;
	Fri,  3 Dec 2021 11:52:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C79D6F80246; Fri,  3 Dec 2021 11:52:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_32,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from msg-4.mailo.com (ip-15.mailobj.net [213.182.54.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 113C8F80085
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 11:52:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 113C8F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="ToCGrLgE"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1638528719; bh=op4eAE5EgTPUDMc1d3nHBpyqAaeQn5ReEbLsvsAx7S0=;
 h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:Content-Type:
 MIME-Version:Content-Transfer-Encoding;
 b=ToCGrLgEvhvD5N43XmIC8yJTsAQlCmpbArzLUNqJ1AwMLoAGoPxysRwvIYj1N9ZTM
 lP7yyEJIZp+QUW5ankhk7wi/FoG/vTSeuY6KL4uCzCcvfU0/lsGpcAIRqHSdmZ5AJi
 Bm07Y+3P3rsHtJXnQ9J0L3/+nxWV30GpQUs5XvLk=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Fri,  3 Dec 2021 11:51:58 +0100 (CET)
X-EA-Auth: s5ryQoFqCNJicQRIEjxDRlc/K05MiS3/O/C0aB3N1rY10zHPcvGxGC+HPqThCc8a8kLFcIaJ+DHaHqppYu1gB4hbR+rcaiK/02cWVb/5dWg=
Message-ID: <f045f25261e0053834d8f2c9c1cf995ae3adc3cf.camel@mailoo.org>
Subject: Practical questions about mainlining a downstream codec driver
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: alsa-devel@alsa-project.org
Date: Fri, 03 Dec 2021 11:51:57 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Stephan Gerhold <stephan@gerhold.net>
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

Hi !

I'm looking at submitting a patch to add support for (i2c) ak4375 codec
(a headphones amplifier). It works in close-to-mainline kernel forks
used in postmarketOS for msm8916-alcatel-idol347 and msm8939-alcatel-idol3
phones (the latter is not in mainline yet).

Currently the driver is mostly a cleanup and update of the downstream one
to use modern framework (eg. regmap, snd_soc_component_* functions, etc.)

The question is : how much should it be trimmed down ?

For example :
IC supports PLL and MCLK modes, and both testing devices use PLL mode.
- should the driver only support the mode that I could test ?
- should the UCM control(s) related to untested mode/features also be trimmed down ?
or can they be kept, with an error/warning that selected value is unsupported ?

Another question :
While both devices are quite close, downstream drivers have little differences.
For example, the idol347 one has an additional initialization register sequence.
What are the options ?
- allow setting this optional sequence from devicetree ?
  with register/values in driver and a boolean devicetree property to enable it ?
  or with an optional devicetree array property
- put it in driver, and associate it with a specific additional compatible ?
- ... ?

Bonus question :
Sadly, there's no detailed datasheet for ak4375 at
https://www.akm.com/eu/en/products/audio/audio-dac/
and only a brief one is floating on the Internets, eg.
https://datasheetspdf.com/pdf-file/1400317/AKM/AK4375A/1
I sent multiple inquiries through akm.com, even mailed directly
to persons with akm.com addresses I could find in alsa mailing list
so as to obtain a complete datasheet, with no success.
Can anyone help with this ?


Work on this driver is there :
https://github.com/msm8916-mainline/linux/pull/203

Thank you



