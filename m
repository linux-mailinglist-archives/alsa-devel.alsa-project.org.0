Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D8D6D9F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 05:23:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C2E81671;
	Tue, 15 Oct 2019 05:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C2E81671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571109793;
	bh=41DHb6uZ+5T4zzJ/2JzGsOqLDeM7iMLmxrP/yZR1yVg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PLlZER+b6wAPjJDHkUcSsV4SehD5QBu+6Q/Cxd+VsnkScc1iRj2goSPY181jxrF98
	 FiTM9721P5RUQaC4MRqMVjnTa9G0m3bMZCoZ+F6z1SOBI4rMiGxhuR5cP0PsFhmIos
	 iV+p5Bf4eX3D6i9Uy4VGA15QUDxbzi7AhMI64mNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAF94F804AB;
	Tue, 15 Oct 2019 05:21:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DCF9F804AA; Tue, 15 Oct 2019 05:21:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01D84F800F4
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 05:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D84F800F4
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 20:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,297,1566889200"; d="scan'208";a="395398741"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 14 Oct 2019 20:21:16 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iKDOd-000Gza-SH; Tue, 15 Oct 2019 11:21:15 +0800
Date: Tue, 15 Oct 2019 11:20:50 +0800
From: kbuild test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <201910151124.lU6kl2Qj%lkp@intel.com>
References: <20191014180059.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014180059.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org, cychiang@google.com, drinkcat@google.com,
 robh+dt@kernel.org, tzungbi@google.com, broonie@kernel.org,
 enric.balletbo@collabora.com, bleung@google.com, dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v3 07/10] ASoC: cros_ec_codec: support WoV
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

Hi Tzung-Bi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on asoc/for-next]
[cannot apply to v5.4-rc3 next-20191014]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Tzung-Bi-Shih/ASoC-mediatek-mt8183-mt6358-ts3a227-max98357-support-WoV/20191014-183227
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> sound/soc/codecs/cros_ec_codec.c:774:7-14: WARNING opportunity for memdup_user

vim +774 sound/soc/codecs/cros_ec_codec.c

   754	
   755	static int wov_hotword_model_put(struct snd_kcontrol *kcontrol,
   756					 const unsigned int __user *bytes,
   757					 unsigned int size)
   758	{
   759		struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
   760		struct cros_ec_codec_priv *priv =
   761			snd_soc_component_get_drvdata(component);
   762		struct ec_param_ec_codec_wov p;
   763		struct ec_response_ec_codec_wov_get_lang r;
   764		uint8_t digest[SHA256_DIGEST_SIZE];
   765		uint8_t *buf;
   766		int ret;
   767	
   768		/* Skips the TLV header. */
   769		bytes += 2;
   770		size -= 8;
   771	
   772		dev_dbg(priv->dev, "%s: size=%d\n", __func__, size);
   773	
 > 774		buf = kmalloc(size, GFP_KERNEL);
   775		if (!buf)
   776			return -ENOMEM;
   777	
   778		if (copy_from_user(buf, bytes, size)) {
   779			ret = -EFAULT;
   780			goto leave;
   781		}
   782	
   783		ret = calculate_sha256(priv, buf, size, digest);
   784		if (ret)
   785			goto leave;
   786	
   787		p.cmd = EC_CODEC_WOV_GET_LANG;
   788		ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
   789					   (uint8_t *)&p, sizeof(p),
   790					   (uint8_t *)&r, sizeof(r));
   791		if (ret)
   792			goto leave;
   793	
   794		if (memcmp(digest, r.hash, SHA256_DIGEST_SIZE) == 0) {
   795			dev_dbg(priv->dev, "not updated");
   796			goto leave;
   797		}
   798	
   799		if (ec_codec_capable(priv, EC_CODEC_CAP_WOV_LANG_SHM))
   800			ret = wov_set_lang_shm(priv, buf, size, digest);
   801		else
   802			ret = wov_set_lang(priv, buf, size, digest);
   803	
   804	leave:
   805		kfree(buf);
   806		return ret;
   807	}
   808	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
