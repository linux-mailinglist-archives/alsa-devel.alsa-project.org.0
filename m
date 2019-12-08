Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F2011614F
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Dec 2019 10:51:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 929421662;
	Sun,  8 Dec 2019 10:50:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 929421662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575798703;
	bh=jH6baPymFAZ0uiPVV4jeb4WNknF/HeaYlGfWsA804eY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YtvA3Osry0gsmJnPc1A5d1pDlccfAWoJZURN1aUJ9eHaoRyNjM450NvAG6j4u0lav
	 Rm/q4PTTbJnhZv0C999VHNIwU3eSR7fPnhEuC/eDgrklduxR7Eaj2ozfXYKyT/x+4H
	 sqmgg1EW8lvOsimaWt1+ouemi4A9u6iqJtaAQwfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05879F801D8;
	Sun,  8 Dec 2019 10:50:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45FBFF80217; Sun,  8 Dec 2019 10:49:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E97BBF8011E
 for <alsa-devel@alsa-project.org>; Sun,  8 Dec 2019 10:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E97BBF8011E
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Dec 2019 01:49:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,291,1571727600"; d="scan'208";a="209847408"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 08 Dec 2019 01:49:49 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1idtCG-000DJo-NY; Sun, 08 Dec 2019 17:49:48 +0800
Date: Sun, 8 Dec 2019 17:49:02 +0800
From: kbuild test robot <lkp@intel.com>
To: Daniel Mack <daniel@zonque.org>
Message-ID: <201912081730.7HtJgBNH%lkp@intel.com>
References: <20191205092129.692520-2-daniel@zonque.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205092129.692520-2-daniel@zonque.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 kbuild-all@lists.01.org, Daniel Mack <daniel@zonque.org>
Subject: Re: [alsa-devel] [PATCH v2 2/2] ASoC: simple-card: add support
	for	codec-to-codec links
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

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on sound/for-next]
[also build test WARNING on asoc/for-next v5.4 next-20191208]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Daniel-Mack/ALSA-core-add-snd_pcm_format_by_name/20191207-084912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-91-g817270f-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> sound/soc/generic/simple-card-utils.c:79:49: sparse: sparse: restricted snd_pcm_format_t degrades to integer

vim +79 sound/soc/generic/simple-card-utils.c

    54	
    55	void asoc_simple_parse_c2c_params(struct device *dev,
    56					  struct device_node *np,
    57					  char *prefix,
    58					  struct snd_soc_pcm_stream *dest)
    59	{
    60		unsigned int rate, channels;
    61		const char *format_string;
    62		snd_pcm_format_t format;
    63		char prop[128];
    64		int ret;
    65	
    66		if (!prefix)
    67			prefix = "";
    68	
    69		snprintf(prop, sizeof(prop), "%s%s", prefix, "codec-to-codec-rate");
    70		of_property_read_u32(np, prop, &rate);
    71	
    72		snprintf(prop, sizeof(prop), "%s%s", prefix, "codec-to-codec-channels");
    73		of_property_read_u32(np, prop, &channels);
    74	
    75		snprintf(prop, sizeof(prop), "%s%s", prefix, "codec-to-codec-format");
    76		if (!of_property_read_string(np, prop, &format_string)) {
    77			ret = snd_pcm_format_by_name(format_string, &format);
    78			if (ret == 0) {
  > 79				dest->formats = 1ULL << format;
    80				dest->channels_min = dest->channels_max = channels;
    81				dest->rate_min = dest->rate_max = rate;
    82			} else {
    83				dev_err(dev, "unknown dai format %s\n", format_string);
    84			}
    85		}
    86	}
    87	EXPORT_SYMBOL_GPL(asoc_simple_parse_c2c_params);
    88	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
