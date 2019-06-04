Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 168EC34D39
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 18:27:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1CD51699;
	Tue,  4 Jun 2019 18:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1CD51699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559665656;
	bh=dqgBatr5K6awYWqiC8ilb5iI7EgIiKrjBUWSq06Ai9g=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bebKjP+O4h/OXoMobeVN/Z0XkD4IZ1Si6ztZhqarcLhmVWD301kL27uspT54TaANY
	 BWEukxCmmyBkVTYczmoEI7e+0xzTXWKh1lqtb0eWQeSn7f8+gm2eNufii912OGv2no
	 uMz3F6aBJMfBqIbLRe+Knr85kCcwKWpVifSWkCeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FC8EF896F7;
	Tue,  4 Jun 2019 18:25:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8EBBF896F7; Tue,  4 Jun 2019 18:25:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BE13F89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 18:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BE13F89673
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 09:25:42 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 04 Jun 2019 09:25:41 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hYCFo-0005Ul-MS; Wed, 05 Jun 2019 00:25:40 +0800
Date: Wed, 5 Jun 2019 00:25:04 +0800
From: kbuild test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Message-ID: <201906050002.8Xgg5xOE%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild-all@01.org
Subject: [alsa-devel] [asoc:for-5.3 110/113]
 sound/soc/codecs/rt1011.c:1148:31: sparse: sparse: incorrect type in
 assignment (different base types)
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3
head:   9b8e8b893ff52264df2b54a6820ae3c4bb820624
commit: d6e65bb7ff0d360c4c5462c3d0b237f2a07e5312 [110/113] ASoC: rt1011: Add RT1011 amplifier driver
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        git checkout d6e65bb7ff0d360c4c5462c3d0b237f2a07e5312
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> sound/soc/codecs/rt1011.c:1148:31: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned short reg @@    got restricted __lunsigned short reg @@
>> sound/soc/codecs/rt1011.c:1148:31: sparse:    expected unsigned short reg
>> sound/soc/codecs/rt1011.c:1148:31: sparse:    got restricted __le16 [usertype]
>> sound/soc/codecs/rt1011.c:1149:31: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned short val @@    got restricted __lunsigned short val @@
>> sound/soc/codecs/rt1011.c:1149:31: sparse:    expected unsigned short val
   sound/soc/codecs/rt1011.c:1149:31: sparse:    got restricted __le16 [usertype]
>> sound/soc/codecs/rt1011.c:1190:41: sparse: sparse: cast to restricted __le16
   sound/soc/codecs/rt1011.c:1191:41: sparse: sparse: cast to restricted __le16

vim +1148 sound/soc/codecs/rt1011.c

  1117	
  1118	static int rt1011_bq_drc_coeff_get(struct snd_kcontrol *kcontrol,
  1119						struct snd_ctl_elem_value *ucontrol)
  1120	{
  1121		struct snd_soc_component *component =
  1122			snd_soc_kcontrol_component(kcontrol);
  1123		struct rt1011_priv *rt1011 =
  1124			snd_soc_component_get_drvdata(component);
  1125		struct rt1011_bq_drc_params *bq_drc_info;
  1126		struct rt1011_bq_drc_params *params =
  1127			(struct rt1011_bq_drc_params *)ucontrol->value.integer.value;
  1128		unsigned int i, mode_idx = 0;
  1129	
  1130		if (strstr(ucontrol->id.name, "AdvanceMode Initial Set"))
  1131			mode_idx = RT1011_ADVMODE_INITIAL_SET;
  1132		else if (strstr(ucontrol->id.name, "AdvanceMode SEP BQ Coeff"))
  1133			mode_idx = RT1011_ADVMODE_SEP_BQ_COEFF;
  1134		else if (strstr(ucontrol->id.name, "AdvanceMode EQ BQ Coeff"))
  1135			mode_idx = RT1011_ADVMODE_EQ_BQ_COEFF;
  1136		else if (strstr(ucontrol->id.name, "AdvanceMode BQ UI Coeff"))
  1137			mode_idx = RT1011_ADVMODE_BQ_UI_COEFF;
  1138		else if (strstr(ucontrol->id.name, "AdvanceMode SmartBoost Coeff"))
  1139			mode_idx = RT1011_ADVMODE_SMARTBOOST_COEFF;
  1140		else
  1141			return -EINVAL;
  1142	
  1143		pr_info("%s, id.name=%s, mode_idx=%d\n", __func__,
  1144			ucontrol->id.name, mode_idx);
  1145		bq_drc_info = rt1011->bq_drc_params[mode_idx];
  1146	
  1147		for (i = 0; i < RT1011_BQ_DRC_NUM; i++) {
> 1148			params[i].reg = cpu_to_le16(bq_drc_info[i].reg);
> 1149			params[i].val = cpu_to_le16(bq_drc_info[i].val);
  1150		}
  1151	
  1152		return 0;
  1153	}
  1154	
  1155	static int rt1011_bq_drc_coeff_put(struct snd_kcontrol *kcontrol,
  1156						struct snd_ctl_elem_value *ucontrol)
  1157	{
  1158		struct snd_soc_component *component =
  1159			snd_soc_kcontrol_component(kcontrol);
  1160		struct rt1011_priv *rt1011 =
  1161			snd_soc_component_get_drvdata(component);
  1162		struct rt1011_bq_drc_params *bq_drc_info;
  1163		struct rt1011_bq_drc_params *params =
  1164			(struct rt1011_bq_drc_params *)ucontrol->value.integer.value;
  1165		unsigned int i, mode_idx = 0;
  1166	
  1167		if (!component->card->instantiated)
  1168			return 0;
  1169	
  1170		if (strstr(ucontrol->id.name, "AdvanceMode Initial Set"))
  1171			mode_idx = RT1011_ADVMODE_INITIAL_SET;
  1172		else if (strstr(ucontrol->id.name, "AdvanceMode SEP BQ Coeff"))
  1173			mode_idx = RT1011_ADVMODE_SEP_BQ_COEFF;
  1174		else if (strstr(ucontrol->id.name, "AdvanceMode EQ BQ Coeff"))
  1175			mode_idx = RT1011_ADVMODE_EQ_BQ_COEFF;
  1176		else if (strstr(ucontrol->id.name, "AdvanceMode BQ UI Coeff"))
  1177			mode_idx = RT1011_ADVMODE_BQ_UI_COEFF;
  1178		else if (strstr(ucontrol->id.name, "AdvanceMode SmartBoost Coeff"))
  1179			mode_idx = RT1011_ADVMODE_SMARTBOOST_COEFF;
  1180		else
  1181			return -EINVAL;
  1182	
  1183		bq_drc_info = rt1011->bq_drc_params[mode_idx];
  1184		memset(bq_drc_info, 0,
  1185			sizeof(struct rt1011_bq_drc_params) * RT1011_BQ_DRC_NUM);
  1186	
  1187		pr_info("%s, id.name=%s, mode_idx=%d\n", __func__,
  1188			ucontrol->id.name, mode_idx);
  1189		for (i = 0; i < RT1011_BQ_DRC_NUM; i++) {
> 1190			bq_drc_info[i].reg =	le16_to_cpu(params[i].reg);
  1191			bq_drc_info[i].val =	le16_to_cpu(params[i].val);
  1192		}
  1193	
  1194		for (i = 0; i < RT1011_BQ_DRC_NUM; i++) {
  1195			if (bq_drc_info[i].reg == 0)
  1196				break;
  1197			else if (rt1011_validate_bq_drc_coeff(bq_drc_info[i].reg)) {
  1198				snd_soc_component_write(component, bq_drc_info[i].reg,
  1199						bq_drc_info[i].val);
  1200			}
  1201		}
  1202	
  1203		return 0;
  1204	}
  1205	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
