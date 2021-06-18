Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4033AC3D8
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 08:27:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D25416F4;
	Fri, 18 Jun 2021 08:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D25416F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623997657;
	bh=sNZinNSPXGMPzjHvw3BQ3sVXu/75vl2IajasXvgfz3I=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R+lD6no46bX2Tu7P4wChBfoI5Lw3F9OxPuBCcVFaGUOvI4qCaUh2pEjlE58GrVClQ
	 T4ajMsDzjmMSPSkR/5q1hY7uPdFHMYXAH3Q5HgFebBVZJYPMeTzniCD+4H3gTnWfLb
	 K+uboKowAf7gFfn710uurcICPM+oLzGyAbPxLUyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA849F80423;
	Fri, 18 Jun 2021 08:26:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2646F8032D; Fri, 18 Jun 2021 08:26:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1B16F800E1
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 08:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1B16F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="X53/pEz4"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I6ApJb005396; Fri, 18 Jun 2021 06:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=W9shZyLpqReiSkvxsZ5HoGFXXpFR1DMN/d0Ru0hCHyg=;
 b=X53/pEz4K0MROJtn06PhB4Ijq1CryAjNGWVZPnSDpR3dIAIRpHS5TxFS20BowrFYCWKr
 Luc/s3o97DcuBrJRGX8RrlH12PienBvjnqWmznUYN7vKqJoCJJdmpgRgq2e5iyP/0pUV
 YHSwHsFc3gSPiZFPWrv0Gzp+0z8FA2m4m8Jep2gEtBettdFJ/4lASlQrMe6LIDEayyzD
 XocC70zQFu6P3WGecf6JqPz1TVwJCFzV7N5N8NPceNp+x7ltIye3zHmc5zKKuS37QJ4T
 26GtUZVMTcoXJxZOEGsfrksq6fy/Auyt1riC5bLa93qygkK85mkNDG7C3e/n58+Jf2dr 0w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 397mptk9hx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 06:25:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15I6PbO7164030;
 Fri, 18 Jun 2021 06:25:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 396wayhjse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 06:25:58 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15I6PvWl164470;
 Fri, 18 Jun 2021 06:25:57 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 396wayhjs7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 06:25:57 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15I6Prm6005262;
 Fri, 18 Jun 2021 06:25:56 GMT
Received: from mwanda (/102.222.70.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Jun 2021 23:25:53 -0700
Date: Fri, 18 Jun 2021 09:25:47 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: srinivas.kandagatla@linaro.org
Subject: [bug report] ASoC: codecs: wcd938x: add capture dapm widgets
Message-ID: <YMw8axj+0LduWerM@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: Jkw99IgyPTuSzYN-2qqowugQSAJPu7k0
X-Proofpoint-ORIG-GUID: Jkw99IgyPTuSzYN-2qqowugQSAJPu7k0
Cc: alsa-devel@alsa-project.org
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

Hello Srinivas Kandagatla,

The patch d5add08fcbce: "ASoC: codecs: wcd938x: add capture dapm
widgets" from Jun 9, 2021, leads to the following static checker
warning:

	sound/soc/codecs/wcd938x.c:2092 wcd938x_tx_swr_ctrl()
	error: uninitialized symbol 'rate'.

sound/soc/codecs/wcd938x.c
  2064          switch (event) {
  2065          case SND_SOC_DAPM_PRE_PMU:
  2066                  if (strnstr(w->name, "ADC", sizeof("ADC"))) {

Use strncmp() here instead of strnstr().

The sizeof() will include the NUL terminator so it's size 4 and you
wanted 3.  The off by one means that strnstr() will do two memcmp()s.
The equivalent of:

	if (memcmp(w->name, "ADC", 3) == 0)
		return w->name;
	if (memcmp(w->name + 1, "ADC", 3) == 0)
		return w->name + 1;
	return NULL;

  2067                          int i = 0, mode = 0;
  2068  
  2069                          if (test_bit(WCD_ADC1, &wcd938x->status_mask))
  2070                                  mode |= tx_mode_bit[wcd938x->tx_mode[WCD_ADC1]];
  2071                          if (test_bit(WCD_ADC2, &wcd938x->status_mask))
  2072                                  mode |= tx_mode_bit[wcd938x->tx_mode[WCD_ADC2]];
  2073                          if (test_bit(WCD_ADC3, &wcd938x->status_mask))
  2074                                  mode |= tx_mode_bit[wcd938x->tx_mode[WCD_ADC3]];
  2075                          if (test_bit(WCD_ADC4, &wcd938x->status_mask))
  2076                                  mode |= tx_mode_bit[wcd938x->tx_mode[WCD_ADC4]];
  2077  
  2078                          if (mode != 0) {
  2079                                  for (i = 0; i < ADC_MODE_ULP2; i++) {
  2080                                          if (mode & (1 << i)) {
  2081                                                  i++;
  2082                                                  break;
  2083                                          }
  2084                                  }
  2085                          }
  2086                          rate = wcd938x_get_clk_rate(i);
  2087                          wcd938x_set_swr_clk_rate(component, rate, bank);
  2088                  }
  2089  
  2090                  if (strnstr(w->name, "ADC", sizeof("ADC")))
  2091                          /* Copy clk settings to active bank */
  2092                          wcd938x_set_swr_clk_rate(component, rate, !bank);

This a false positive, but you could silence it by combining it with the
previous if block.

  2093                  break;
  2094          case SND_SOC_DAPM_POST_PMD:
  2095                  if (strnstr(w->name, "ADC", sizeof("ADC"))) {
  2096                          rate = wcd938x_get_clk_rate(ADC_MODE_INVALID);
  2097                          wcd938x_set_swr_clk_rate(component, rate, !bank);
  2098                          wcd938x_set_swr_clk_rate(component, rate, bank);
  2099                  }
  2100                  break;
  2101          }

regards,
dan carpenter
